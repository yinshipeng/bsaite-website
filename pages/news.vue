<template>
  <div class="news">
    <section class="hero-section">
      <div class="container">
        <h1>新闻资讯</h1>
        <p>了解芭赛特最新动态</p>
      </div>
    </section>

    <section class="news-list">
      <div class="container">
        <div class="news-items">
          <article class="news-card" v-for="(article, index) in newsArticles" :key="index">
            <div class="news-image">
              <img :src="article.image" :alt="article.title" class="news-img" />
            </div>
            <div class="news-content">
              <div class="news-date">{{ article.date }}</div>
              <h3>{{ article.title }}</h3>
              <p>{{ article.summary }}</p>
              <NuxtLink :to="`/news/${article.id}`" class="read-more">阅读全文</NuxtLink>
            </div>
          </article>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
const newsArticles = [
  {
    id: '1',
    title: '芭赛特公司荣获农业技术创新奖',
    summary: '我公司研发的海藻矿源氨基酸水溶肥料技术获得河南省农业技术创新奖，该技术有效提升了作物产量和品质，为现代农业发展贡献了力量...',
    date: '2025-01-25',
    image: 'https://images.unsplash.com/photo-1551135049-8a33b5883817?w=400&h=250&fit=crop&crop=center'
  },
  {
    id: '2',
    title: '新型海藻矿源冲施肥正式投产',
    summary: '经过两年的研发和试验，芭赛特公司新型海藻矿源冲施肥正式投入生产，产品富含多种微量元素和生物活性物质，可有效提高土壤肥力...',
    date: '2025-01-22',
    image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=250&fit=crop&crop=center'
  },
  {
    id: '3',
    title: '与中科院合作建立农业技术研发中心',
    summary: '芭赛特公司与中科院农业研究所签署合作协议，共同建立农业技术研发中心，专注于海洋生物活性物质的提取和应用研究，推动农业科技进步...',
    date: '2025-01-20',
    image: 'https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?w=400&h=250&fit=crop&crop=center'
  },
  {
    id: '4',
    title: '参加河南省农业博览会展示最新产品',
    summary: '在河南省农业博览会上，我公司展示了最新研发的海藻矿源系列肥料产品，吸引了众多农业专家和农民朋友的关注，现场签约订单超过500万元...',
    date: '2025-01-18',
    image: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=400&h=250&fit=crop&crop=center'
  },
  {
    id: '5',
    title: '公司获得ISO9001质量管理体系认证',
    summary: '经过严格的审核和评审，芭赛特公司正式获得ISO9001质量管理体系认证，标志着公司在产品质量管理方面达到了国际先进水平，为客户提供更好的产品和服务...',
    date: '2025-01-15',
    image: 'https://images.unsplash.com/photo-1464226184884-fa280b87c399?w=400&h=250&fit=crop&crop=center'
  },
  {
    id: '6',
    title: '在商丘建设新的生产基地',
    summary: '为满足市场不断增长的需求，芭赛特公司在商丘启动新的生产基地建设项目，新基地占地30亩，预计年产能将达到10万吨，为公司未来发展奠定坚实基础...',
    date: '2025-01-12',
    image: 'https://images.unsplash.com/photo-1565008447742-97f6f38c985c?w=400&h=250&fit=crop&crop=center'
  },
  {
    id: '7',
    title: '公司团队获得科技进步奖',
    summary: '我公司研发团队在海洋生物活性物质提取技术方面取得重大突破，获得河南省科技进步奖二等奖，该技术已申请多项国家发明专利，并开始产业化应用...',
    date: '2025-01-08',
    image: 'https://images.unsplash.com/photo-1560493676-04071c5f467b?w=400&h=250&fit=crop&crop=center'
  },
  {
    id: '8',
    title: '与多家农业合作社签署战略合作协议',
    summary: '近日，芭赛特公司与河南省多家农业合作社签署战略合作协议，将在技术支持、产品供应、市场推广等方面开展全面合作，共同推动现代农业发展...',
    date: '2025-01-05',
    image: 'https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?w=400&h=250&fit=crop&crop=center'
  }
]
</script>

<style scoped>
.hero-section {
  background: linear-gradient(135deg, #4CAF50, #2E7D32);
  color: white;
  padding: 80px 0;
  text-align: center;
}

.hero-section h1 {
  font-size: 42px;
  margin-bottom: 15px;
}

.hero-section p {
  font-size: 18px;
  opacity: 0.9;
}

.news-list {
  padding: 60px 0;
}

.news-items {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 30px;
}

.news-card {
  background: white;
  border-radius: 15px;
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
}

.news-card:hover {
  transform: translateY(-5px);
}

.news-image {
  height: 200px;
  overflow: hidden;
}

.news-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.news-card:hover .news-img {
  transform: scale(1.05);
}

.news-content {
  padding: 20px;
}

.news-date {
  color: #4CAF50;
  font-size: 12px;
  font-weight: 500;
  margin-bottom: 10px;
}

.news-content h3 {
  font-size: 18px;
  color: #333;
  margin-bottom: 15px;
  line-height: 1.4;
}

.news-content p {
  color: #666;
  line-height: 1.6;
  margin-bottom: 15px;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.read-more {
  color: #4CAF50;
  text-decoration: none;
  font-weight: 500;
  font-size: 14px;
}

.read-more:hover {
  text-decoration: underline;
}
</style>