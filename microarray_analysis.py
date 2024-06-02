import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
import matplotlib.pyplot as plt

# 读取数据
data = pd.read_csv('microarray_data.csv')
# 数据标准化
scaler = StandardScaler()
scaled_data = scaler.fit_transform(data)

# PCA分析
pca = PCA(n_components=2)
pca_result = pca.fit_transform(scaled_data)

# 可视化
plt.scatter(pca_result[:, 0], pca_result[:, 1])
plt.title('PCA of Microarray Data')
plt.xlabel('PC1')
plt.ylabel('PC2')
plt.show()
