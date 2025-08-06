<template>
  <div class="news-detail">
    <section class="hero-section">
      <div class="container">
        <nav class="breadcrumb">
          <NuxtLink to="/">首页</NuxtLink>
          <span class="separator">/</span>
          <NuxtLink to="/news">新闻资讯</NuxtLink>
          <span class="separator">/</span>
          <span class="current">详情</span>
        </nav>
      </div>
    </section>

    <section class="article-content" v-if="article">
      <div class="container">
        <article class="article">
          <header class="article-header">
            <h1>{{ article.title }}</h1>
            <div class="article-meta">
              <span class="date">{{ article.date }}</span>
              <span class="separator">|</span>
              <span class="source">芭赛特进出口（商丘）有限公司</span>
            </div>
          </header>
          
          <div class="article-image">
            <img :src="article.image" :alt="article.title" />
          </div>
          
          <div class="article-body">
            <div class="content" v-html="article.content"></div>
          </div>
          
          <footer class="article-footer">
            <div class="share-section">
              <h4>分享此文章</h4>
              <div class="share-buttons">
                <button class="share-btn wechat">微信</button>
                <button class="share-btn weibo">微博</button>
                <button class="share-btn qq">QQ</button>
              </div>
            </div>
          </footer>
        </article>
        
        <aside class="related-news">
          <h3>相关新闻</h3>
          <div class="related-list">
            <div class="related-item" v-for="related in relatedNews" :key="related.id">
              <div class="related-image">
                <img :src="related.image" :alt="related.title" />
              </div>
              <div class="related-content">
                <h4>{{ related.title }}</h4>
                <span class="related-date">{{ related.date }}</span>
              </div>
            </div>
          </div>
        </aside>
      </div>
    </section>
    
    <section class="not-found" v-else>
      <div class="container">
        <div class="not-found-content">
          <h2>文章未找到</h2>
          <p>抱歉，您要查看的文章不存在或已被移除。</p>
          <NuxtLink to="/news" class="back-btn">返回新闻列表</NuxtLink>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
const route = useRoute()
const router = useRouter()

// 模拟新闻数据（实际项目中应该从API获取）
const newsData = {
  '1': {
    id: '1',
    title: '芭赛特公司荣获农业技术创新奖',
    summary: '我公司研发的海藻矿源氨基酸水溶肥料技术获得河南省农业技术创新奖，该技术有效提升了作物产量和品质，为现代农业发展贡献了力量...',
    date: '2025-01-25',
    image: 'https://images.unsplash.com/photo-1551135049-8a33b5883817?w=800&h=400&fit=crop&crop=center',
    content: `
      <p>近日，芭赛特进出口（商丘）有限公司传来喜讯，公司自主研发的海藻矿源氨基酸水溶肥料技术荣获河南省农业技术创新奖，这一殊荣标志着公司在农业科技创新领域取得了重要突破。</p>
      
      <h3>技术创新成果显著</h3>
      <p>该项技术历时三年研发，通过独特的海藻提取工艺，成功提取出多种活性氨基酸和微量元素，形成了具有自主知识产权的水溶肥料配方。经过大田试验验证，使用该产品的作物产量平均提高15-20%，品质显著改善。</p>
      
      <h3>产业化应用前景广阔</h3>
      <p>该技术不仅在理论研究上取得突破，更重要的是已经实现了产业化应用。目前，公司年产海藻矿源氨基酸水溶肥料5万吨，产品远销全国20多个省市，深受农户好评。</p>
      
      <h3>推动现代农业发展</h3>
      <p>这一技术创新不仅为公司带来了经济效益，更为现代农业发展贡献了科技力量。通过减少化肥使用量、提高作物品质，该技术有力促进了绿色农业和可持续发展。</p>
      
      <p>未来，芭赛特公司将继续加大科技研发投入，不断推出更多创新产品，为中国农业现代化建设做出更大贡献。</p>
    `
  },
  '2': {
    id: '2',
    title: '新型海藻矿源冲施肥正式投产',
    summary: '经过两年的研发和试验，芭赛特公司新型海藻矿源冲施肥正式投入生产，产品富含多种微量元素和生物活性物质，可有效提高土壤肥力...',
    date: '2025-01-22',
    image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=800&h=400&fit=crop&crop=center',
    content: `
      <p>1月22日，芭赛特进出口（商丘）有限公司新型海藻矿源冲施肥生产线正式投产，这标志着公司在农业科技产业化方面迈出了重要一步。</p>
      
      <h3>两年精心研发</h3>
      <p>该产品历经两年的研发和试验，通过优化海藻提取工艺和配方设计，成功开发出富含多种微量元素和生物活性物质的新型冲施肥。产品在保证营养全面性的同时，大幅提高了土壤肥力和作物吸收效率。</p>
      
      <h3>生产工艺先进</h3>
      <p>新建成的生产线采用国际先进的自动化生产设备，年产能达到3万吨。生产过程严格按照ISO9001质量管理体系执行，确保产品质量稳定可靠。</p>
      
      <h3>市场前景良好</h3>
      <p>该产品一经推出就受到市场热烈欢迎，目前已与多家农业合作社和种植大户签订供货协议，预计今年销售额将超过5000万元。</p>
    `
  }
}

const relatedNewsData = [
  {
    id: '3',
    title: '与中科院合作建立农业技术研发中心',
    date: '2025-01-20',
    image: 'https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?w=150&h=100&fit=crop&crop=center'
  },
  {
    id: '4',
    title: '参加河南省农业博览会展示最新产品',
    date: '2025-01-18',
    image: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=150&h=100&fit=crop&crop=center'
  },
  {
    id: '5',
    title: '公司获得ISO9001质量管理体系认证',
    date: '2025-01-15',
    image: 'https://images.unsplash.com/photo-1464226184884-fa280b87c399?w=150&h=100&fit=crop&crop=center'
  }
]

const articleId = route.params.id
const article = newsData[articleId] || null
const relatedNews = relatedNewsData.filter(item => item.id !== articleId)

// 设置SEO信息
if (article) {
  useHead({
    title: `${article.title} - 芭赛特进出口（商丘）有限公司`,
    meta: [
      { name: 'description', content: article.summary }
    ]
  })
}
</script>

<style scoped>
.hero-section {
  background: linear-gradient(135deg, #4CAF50, #2E7D32);
  color: white;
  padding: 40px 0;
}

.breadcrumb {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 14px;
}

.breadcrumb a {
  color: rgba(255, 255, 255, 0.8);
  text-decoration: none;
  transition: color 0.3s ease;
}

.breadcrumb a:hover {
  color: white;
}

.separator {
  color: rgba(255, 255, 255, 0.6);
}

.current {
  color: white;
  font-weight: 500;
}

.article-content {
  padding: 60px 0;
  background: #f8f9fa;
}

.article {
  background: white;
  border-radius: 15px;
  padding: 40px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
  margin-bottom: 40px;
}

.article-header {
  margin-bottom: 30px;
  text-align: center;
  border-bottom: 1px solid #eee;
  padding-bottom: 30px;
}

.article-header h1 {
  font-size: 32px;
  color: #2E7D32;
  margin-bottom: 15px;
  line-height: 1.4;
}

.article-meta {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 15px;
  color: #666;
  font-size: 14px;
}

.article-image {
  margin: 30px 0;
  text-align: center;
}

.article-image img {
  width: 100%;
  max-width: 800px;
  height: 400px;
  object-fit: cover;
  border-radius: 10px;
  box-shadow: 0 5px 20px rgba(0,0,0,0.1);
}

.article-body {
  font-size: 16px;
  line-height: 1.8;
  color: #333;
}

.content {
  max-width: none;
}

.content p {
  margin-bottom: 20px;
  text-align: justify;
}

.content h3 {
  font-size: 20px;
  color: #2E7D32;
  margin: 30px 0 15px;
  font-weight: 600;
}

.article-footer {
  margin-top: 40px;
  padding-top: 30px;
  border-top: 1px solid #eee;
}

.share-section h4 {
  font-size: 16px;
  color: #333;
  margin-bottom: 15px;
}

.share-buttons {
  display: flex;
  gap: 10px;
}

.share-btn {
  padding: 8px 16px;
  border: 1px solid #ddd;
  background: white;
  color: #666;
  border-radius: 20px;
  cursor: pointer;
  font-size: 12px;
  transition: all 0.3s ease;
}

.share-btn:hover {
  background: #4CAF50;
  color: white;
  border-color: #4CAF50;
}

.related-news {
  background: white;
  border-radius: 15px;
  padding: 30px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
}

.related-news h3 {
  font-size: 20px;
  color: #2E7D32;
  margin-bottom: 20px;
  text-align: center;
}

.related-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.related-item {
  display: flex;
  gap: 15px;
  padding: 15px;
  border: 1px solid #eee;
  border-radius: 10px;
  transition: all 0.3s ease;
  cursor: pointer;
}

.related-item:hover {
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
  transform: translateY(-2px);
}

.related-image {
  width: 80px;
  height: 60px;
  flex-shrink: 0;
}

.related-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 5px;
}

.related-content {
  flex: 1;
}

.related-content h4 {
  font-size: 14px;
  color: #333;
  margin-bottom: 8px;
  line-height: 1.4;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.related-date {
  font-size: 12px;
  color: #999;
}

.not-found {
  padding: 100px 0;
  text-align: center;
}

.not-found-content h2 {
  font-size: 32px;
  color: #333;
  margin-bottom: 15px;
}

.not-found-content p {
  font-size: 16px;
  color: #666;
  margin-bottom: 30px;
}

.back-btn {
  display: inline-block;
  padding: 12px 30px;
  background: #4CAF50;
  color: white;
  text-decoration: none;
  border-radius: 25px;
  transition: background 0.3s ease;
}

.back-btn:hover {
  background: #45a049;
}

@media (max-width: 768px) {
  .article {
    padding: 20px;
  }
  
  .article-header h1 {
    font-size: 24px;
  }
  
  .article-meta {
    flex-direction: column;
    gap: 5px;
  }
  
  .share-buttons {
    justify-content: center;
  }
  
  .related-item {
    flex-direction: column;
    text-align: center;
  }
  
  .related-image {
    width: 100%;
    height: 150px;
  }
}
</style>