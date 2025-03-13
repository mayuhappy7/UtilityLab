import os
import cv2 as cv
import numpy as np
import faiss
from itertools import combinations
import psycopg2
os.environ['KMP_DUPLICATE_LIB_OK'] = 'True'

# 设置图片目录
image_dir = "/Users/after/File/Flutter/psimage"

# 获取所有图片路径
image_paths = [os.path.join(image_dir, f) for f in os.listdir(image_dir) if f.endswith(('.jpg', '.png', '.jpeg'))]

# 创建 SIFT 关键点检测器
sift = cv.SIFT_create()

# 存储特征数据
features = {}  # {image_path: (keypoints, descriptors)}

# 读取图片并提取特征
for img_path in image_paths:
    img = cv.imread(img_path)  # 读取彩色图
    if img is None:
        continue
    
    # 调整图片分辨率为 500*800
    img = cv.resize(img, (800, 800))
    
    # 转为灰度图进行特征提取
    gray_img = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
    kp, des = sift.detectAndCompute(gray_img, None)
    
    if des is not None:  # 确保检测到了特征点
        features[img_path] = (kp, des)

# 获取所有图像的组合进行两两匹配
image_pairs = list(combinations(features.keys(), 2))

# 存储匹配结果
match_results = []

# 遍历所有图片对
for img1_path, img2_path in image_pairs:
    kp1, des1 = features[img1_path]
    kp2, des2 = features[img2_path]

    d = des1.shape[1]  # SIFT 维度 (128)
    
    # 使用 Faiss 进行匹配
    index = faiss.IndexFlatL2(d)
    index.add(des2)  # 添加第二张图的特征
    
    D, I = index.search(des1, 2)  # 搜索最近邻 (k=2)
    
    # 进行 Lowe's ratio test
    good_matches = [i for i in range(len(I)) if D[i][0] < 0.7 * D[i][1]]
    
    match_score = len(good_matches)  # 匹配得分（匹配点的数量）
    
    match_results.append((img1_path, img2_path, match_score))

# 连接到 PostgreSQL 数据库
conn = psycopg2.connect(
    dbname="lydb",
    user="postgres",
    password="radiant",
    host="192.144.237.65",
    port="54321"
)
cur = conn.cursor()

# # 创建表格（如果尚未创建）
# cur.execute('''
#     CREATE TABLE IF NOT EXISTS image_matches (
#         id SERIAL PRIMARY KEY,
#         img1_dir TEXT,
#         img1_name TEXT,
#         img2_dir TEXT, 
#         img2_name TEXT,
#         match_score INTEGER
#     )
# ''')
# conn.commit()

# 清空表格数据
cur.execute('''
    TRUNCATE TABLE image_matches
''')
conn.commit()

# 按匹配得分排序，找出匹配度最高的图片对
match_results.sort(key=lambda x: x[2], reverse=True)

# 仅输出匹配度高的前 N 组（可调整）
top_n = 15
print("\n匹配度最高的图片对:")
for i, (img1, img2, score) in enumerate(match_results[:top_n]):
    # 拆分路径和文件名
    img1_dir, img1_name = os.path.dirname(img1), os.path.basename(img1)
    img2_dir, img2_name = os.path.dirname(img2), os.path.basename(img2)
    
    print(f"{i+1}. 目录: {img1_dir} 文件: {img1_name} <-> 目录: {img2_dir} 文件: {img2_name} | 分数: {score}")
    
    # 更新插入语句
    cur.execute('''
        INSERT INTO image_matches (img1_dir, img1_name, img2_dir, img2_name, match_score)
        VALUES (%s, %s, %s, %s, %s)
    ''', (img1_dir, img1_name, img2_dir, img2_name, score))
# 提交事务并关闭连接
conn.commit()
cur.close()
conn.close()
