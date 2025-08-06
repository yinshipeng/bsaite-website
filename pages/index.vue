<template>
  <div class="home">
    <!-- Hero Section -->
    <section class="hero-section">
      <div class="hero-background"></div>
      <div class="container">
        <div class="hero-content">
          <h1>芭赛特进出口（商丘）有限公司</h1>
          <p>专业从事海藻矿源肥料研发、生产与销售</p>
          <div class="hero-features">
            <div class="feature-item">
              <h3>优质产品</h3>
              <p>海藻矿源氨基酸水溶肥料</p>
            </div>
            <div class="feature-item">
              <h3>技术创新</h3>
              <p>复合微生物肥料研发</p>
            </div>
            <div class="feature-item">
              <h3>品质保证</h3>
              <p>严格质量控制体系</p>
            </div>
          </div>
          <div class="hero-buttons">
            <NuxtLink to="/products" class="btn-primary">产品中心</NuxtLink>
            <NuxtLink to="/contact" class="btn-secondary">联系我们</NuxtLink>
          </div>
        </div>
      </div>
    </section>

    <!-- News Section -->
    <section class="news-section">
      <div class="container">
        <div class="section-title">
          <span class="diamond">◇</span>
          <h2>新闻列表</h2>
          <span class="diamond">◇</span>
        </div>
        
        <div class="news-list">
          <article class="news-item">
            <div class="news-image">
              <img src="https://images.unsplash.com/photo-1500937386664-56d1dfef3854?w=300&h=200&fit=crop&crop=center" alt="绿色现代农业" class="news-img" />
            </div>
            <div class="news-content">
              <h3>芭赛特公司荣获农业技术创新奖</h3>
              <p>我公司研发的海藻矿源氨基酸水溶肥料技术获得河南省农业技术创新奖，该技术有效提升了作物产量和品质...</p>
              <div class="news-meta">
                <span class="date">2025-01-15</span>
                <button class="read-more">查看详情</button>
              </div>
            </div>
          </article>
          
          <article class="news-item">
            <div class="news-image">
              <img src="https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=300&h=200&fit=crop&crop=center" alt="有机农业" class="news-img" />
            </div>
            <div class="news-content">
              <h3>新型海藻矿源冲施肥正式投产</h3>
              <p>经过两年的研发和试验，芭赛特公司新型海藻矿源冲施肥正式投入生产，产品富含多种微量元素和生物活性物质...</p>
              <div class="news-meta">
                <span class="date">2025-01-10</span>
                <button class="read-more">查看详情</button>
              </div>
            </div>
          </article>
          
          <article class="news-item">
            <div class="news-image">
              <img src="https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?w=300&h=200&fit=crop&crop=center" alt="农业科技" class="news-img" />
            </div>
            <div class="news-content">
              <h3>与中科院合作建立农业技术研发中心</h3>
              <p>芭赛特公司与中科院农业研究所签署合作协议，共同建立农业技术研发中心，专注于海洋生物活性物质的提取和应用...</p>
              <div class="news-meta">
                <span class="date">2025-01-05</span>
                <button class="read-more">查看详情</button>
              </div>
            </div>
          </article>
        </div>
      </div>
    </section>

    <!-- Simple Product Grid -->
    <section class="products-section">
      <div class="container">
        <div class="section-title">
          <span class="diamond">◇</span>
          <h2>产品展示</h2>
          <span class="diamond">◇</span>
        </div>
        
        <div class="products-grid">
          <div class="product-card">
            <div class="product-image">
              <img src="https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=250&h=300&fit=crop&crop=center" alt="绿色肥料袋" class="product-img" />
            </div>
            <div class="product-title">10kg干悬浮氨元素</div>
          </div>
          
          <div class="product-card">
            <div class="product-image">
              <img src="https://images.unsplash.com/photo-1586864387967-d02ef85d93e8?w=250&h=300&fit=crop&crop=center" alt="红色肥料袋" class="product-img" />
            </div>
            <div class="product-title">大袋-10kg大量元素氮子（高磷）</div>
          </div>
          
          <div class="product-card">
            <div class="product-image">
              <img src="https://images.unsplash.com/photo-1574263919864-a95de3c1c3c0?w=250&h=300&fit=crop&crop=center" alt="橙色肥料袋" class="product-img" />
            </div>
            <div class="product-title">大袋-10kg大量元素氮子（高氮高钾）</div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
// Simple test version
console.log('Index page is loading...')
</script>

<style scoped>
.home {
  width: 100%;
  min-height: 100vh;
}

/* Hero Section */
.hero-section {
  position: relative;
  padding: 120px 0;
  color: white;
  text-align: center;
  overflow: hidden;
}

.hero-background {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(rgba(46, 125, 50, 0.8), rgba(76, 175, 80, 0.8)), 
              url('https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=1920&h=1080&fit=crop&crop=center');
  background-size: cover;
  background-position: center;
  z-index: -1;
}

.hero-content {
  max-width: 800px;
  margin: 0 auto;
}

.hero-section h1 {
  font-size: 48px;
  margin-bottom: 20px;
  font-weight: 700;
}

.hero-section p {
  font-size: 24px;
  margin-bottom: 50px;
  opacity: 0.95;
}

.hero-features {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 30px;
  margin-bottom: 50px;
}

.feature-item {
  background: rgba(255, 255, 255, 0.15);
  padding: 30px 20px;
  border-radius: 15px;
  backdrop-filter: blur(10px);
}

.feature-item h3 {
  font-size: 20px;
  margin-bottom: 10px;
  color: #fff;
}

.feature-item p {
  font-size: 14px;
  margin: 0;
  opacity: 0.9;
}

.hero-buttons {
  display: flex;
  gap: 20px;
  justify-content: center;
}

.btn-primary {
  background: #fff;
  color: #2E7D32;
  padding: 15px 30px;
  border-radius: 30px;
  text-decoration: none;
  font-weight: 600;
  transition: all 0.3s ease;
}

.btn-primary:hover {
  background: #f0f0f0;
  transform: translateY(-2px);
}

.btn-secondary {
  background: transparent;
  color: #fff;
  padding: 15px 30px;
  border: 2px solid #fff;
  border-radius: 30px;
  text-decoration: none;
  font-weight: 600;
  transition: all 0.3s ease;
}

.btn-secondary:hover {
  background: #fff;
  color: #2E7D32;
}

/* Section Titles */
.section-title {
  text-align: center;
  margin-bottom: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 20px;
}

.section-title h2 {
  font-size: 28px;
  color: #4CAF50;
  margin: 0;
}

.diamond {
  color: #4CAF50;
  font-size: 20px;
}

/* News Section */
.news-section {
  padding: 60px 0;
  background: white;
}

.news-list {
  display: flex;
  flex-direction: column;
  gap: 25px;
}

.news-item {
  display: flex;
  background: white;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  overflow: hidden;
}

.news-image {
  width: 200px;
  flex-shrink: 0;
}

.news-img {
  width: 100%;
  height: 150px;
  border-radius: 8px;
  object-fit: cover;
}

.news-content {
  padding: 20px;
  flex: 1;
}

.news-content h3 {
  font-size: 16px;
  margin-bottom: 10px;
  color: #333;
  line-height: 1.4;
}

.news-content p {
  color: #666;
  font-size: 14px;
  line-height: 1.6;
  margin-bottom: 15px;
}

.news-meta {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.date {
  color: #999;
  font-size: 12px;
}

.read-more {
  background: #4CAF50;
  color: white;
  border: none;
  padding: 6px 15px;
  border-radius: 15px;
  font-size: 12px;
  cursor: pointer;
}

/* Products Section */
.products-section {
  padding: 60px 0;
  background: #f9f9f9;
}

.products-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  margin-top: 40px;
}

.product-card {
  background: white;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  border: 1px solid #e0e0e0;
}

.product-image {
  height: 200px;
  background: #f5f5f5;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
}

.product-img {
  width: 100%;
  height: 100%;
  border-radius: 8px;
  object-fit: cover;
  box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.product-title {
  padding: 15px;
  text-align: center;
  background: #2E7D32;
  color: white;
  font-size: 14px;
  font-weight: 500;
}

/* Responsive Design */
@media (max-width: 768px) {
  .hero-section h1 {
    font-size: 32px;
  }
  
  .hero-section p {
    font-size: 18px;
  }
  
  .hero-features {
    grid-template-columns: 1fr;
    gap: 20px;
  }
  
  .hero-buttons {
    flex-direction: column;
    align-items: center;
  }
  
  .products-grid {
    grid-template-columns: repeat(2, 1fr);
  }
  
  .news-item {
    flex-direction: column;
  }
  
  .news-image {
    width: 100%;
  }
}
</style>