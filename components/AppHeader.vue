<template>
  <header class="header">
    <div class="container">
      <div class="header-content">
        <div class="logo">
          <img src="/logo.svg" alt="芭赛特进出口" />
          <div class="logo-text">
            <h1>芭赛特进出口(商丘)有限公司</h1>
            <p>Basaite Import and Export (Shangqiu) Group Co., Ltd.</p>
          </div>
        </div>
        
        <nav class="nav">
          <ul class="nav-list">
            <li><NuxtLink to="/" class="nav-link">网站首页</NuxtLink></li>
            <li><NuxtLink to="/about" class="nav-link">企业简介</NuxtLink></li>
            <li><NuxtLink to="/products" class="nav-link">产品中心</NuxtLink></li>
            <li><NuxtLink to="/news" class="nav-link">新闻资讯</NuxtLink></li>
            <li><NuxtLink to="/solutions" class="nav-link">解决方案</NuxtLink></li>
            <li><NuxtLink to="/contact" class="nav-link">联系我们</NuxtLink></li>
          </ul>
        </nav>
      </div>
    </div>
  </header>
</template>

<style scoped>
.header {
  background: #fff;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  position: sticky;
  top: 0;
  z-index: 1000;
}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 0;
}

.logo {
  display: flex;
  align-items: center;
  gap: 15px;
}

.logo img {
  height: 50px;
  width: 50px;
  border-radius: 50%;
  background: linear-gradient(135deg, #4CAF50, #2E7D32);
}

.logo-text h1 {
  font-size: 20px;
  color: #2E7D32;
  margin-bottom: 2px;
}

.logo-text p {
  font-size: 12px;
  color: #666;
}

.nav-list {
  display: flex;
  list-style: none;
  gap: 30px;
}

.nav-link {
  text-decoration: none;
  color: #333;
  font-size: 16px;
  font-weight: 500;
  padding: 10px 15px;
  border-radius: 5px;
  transition: all 0.3s ease;
}

.nav-link:hover,
.nav-link.router-link-active {
  color: #4CAF50;
  background: rgba(76, 175, 80, 0.1);
}

@media (max-width: 768px) {
  .header-content {
    flex-direction: column;
    gap: 15px;
  }
  
  .nav-list {
    flex-wrap: wrap;
    justify-content: center;
    gap: 15px;
  }
  
  .logo-text h1 {
    font-size: 16px;
  }
}
</style>