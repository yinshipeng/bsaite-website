<template>
  <div class="about">
    <section class="hero-section">
      <div class="container">
        <h1>企业简介</h1>
        <p>了解芭赛特进出口(商丘)有限公司</p>
      </div>
    </section>

    <section class="company-intro">
      <div class="container">
        <div class="section-title">
          <span class="title-decoration">◇</span>
          <h2>企业简介</h2>
          <span class="title-decoration">◇</span>
        </div>
        
        <div class="intro-content">
          <div class="intro-text">
            <p>芭赛特进出口（商丘）有限公司成立于2025-03-19，法定代表人为王卫兵，注册资本为100万元，统一社会信用代码为91411421MAEF5J2U3T，企业注册地址位于河南省商丘市民权县绿洲街道办事处庄周大道东段北侧2-1号，所属行业为批发业。</p>
            
            <p>经营范围包含：一般项目：货物进出口；技术进出口；肥料销售；化肥销售；化工产品生产（不含许可类化工产品）；化工产品销售（不含许可类化工产品）；土壤与肥料的复混加工；技术服务、技术开发、技术咨询、技术交流、技术转让、技术推广；进出口代理；复合微生物肥料研发；海洋生物活性物质提取、纯化、合成技术研发（除许可业务外，可自主依法经营法律法规非禁止或限制的项目）。</p>
            
            <p>企业当前经营状态为存续。</p>
          </div>
          
          <div class="intro-image">
            <img src="https://images.unsplash.com/photo-1565008447742-97f6f38c985c?w=400&h=400&fit=crop&crop=center" alt="公司建筑" class="company-img" />
          </div>
        </div>
      </div>
    </section>

    <section class="company-values">
      <div class="container">
        <div class="section-title">
          <span class="title-decoration">◇</span>
          <h2>企业宗旨</h2>
          <span class="title-decoration">◇</span>
        </div>
        
        <div class="values-content">
          <h3>企业宗旨</h3>
          <div class="values-list">
            <div class="value-item">
              <strong>核心价值观：</strong>
              <span>坚持创新、诚信经营、客户至上、品质保证</span>
            </div>
            <div class="value-item">
              <strong>发展理念：</strong>
              <span>以科技创新为驱动力，为农业发展提供优质产品</span>
            </div>
            <div class="value-item">
              <strong>服务理念：</strong>
              <span>专业高效、贴心服务、持续改进</span>
            </div>
            <div class="value-item">
              <strong>质量方针：</strong>
              <span>严格质量控制，提供安全有效的农业产品</span>
            </div>
            <div class="value-item">
              <strong>公司使命：</strong>
              <span>致力于为现代农业发展贡献力量，推动农业技术进步</span>
            </div>
            <div class="value-item">
              <strong>公司愿景：</strong>
              <span>成为中原地区领先的农业科技企业</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="company-profile">
      <div class="container">
        <div class="section-title">
          <span class="title-decoration">◇</span>
          <h2>企业概况</h2>
          <span class="title-decoration">◇</span>
        </div>
        
        <div class="profile-content">
          <div class="profile-list">
            <div class="profile-item">
              <strong>荣誉资质：</strong>
              <span>获得多项农业技术专利，建立多项行业合作关系</span>
            </div>
            <div class="profile-item">
              <strong>主要关键：</strong>
              <span>以人为本、设立全员目标、科学构建质量管理体系</span>
            </div>
            <div class="profile-item">
              <strong>管理理念：</strong>
              <span>严格质量、细化管理体系、建立优秀的团队行业构建体系</span>
            </div>
            <div class="profile-item">
              <strong>公司理念：</strong>
              <span>质量是企业的生命，创新是企业发展的动力</span>
            </div>
          </div>
          
          <div class="profile-image">
            <img src="https://images.unsplash.com/photo-1551135049-8a33b5883817?w=300&h=350&fit=crop&crop=center" alt="企业荣誉" class="award-img" />
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

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

.company-intro {
  padding: 60px 0;
  background: white;
}

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
  color: #2E7D32;
}

.title-decoration {
  color: #4CAF50;
  font-size: 24px;
}

.intro-content {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 40px;
  align-items: center;
}

.intro-text p {
  font-size: 16px;
  line-height: 1.8;
  color: #555;
  margin-bottom: 20px;
  text-align: justify;
}

.intro-image {
  display: flex;
  justify-content: center;
}

.company-img {
  width: 300px;
  height: 300px;
  border-radius: 10px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
  object-fit: cover;
}

.company-values {
  padding: 60px 0;
  background: #f9f9f9;
}

.values-content {
  text-align: center;
}

.values-content h3 {
  font-size: 24px;
  color: #2E7D32;
  margin-bottom: 30px;
}

.values-list {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 20px;
  max-width: 800px;
  margin: 0 auto;
}

.value-item {
  background: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
  text-align: left;
}

.value-item strong {
  color: #2E7D32;
  display: block;
  margin-bottom: 8px;
}

.value-item span {
  color: #666;
  line-height: 1.6;
}

.company-profile {
  padding: 60px 0;
  background: linear-gradient(135deg, #E3F2FD, #BBDEFB);
}

.profile-content {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 40px;
  align-items: center;
}

.profile-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.profile-item {
  background: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.profile-item strong {
  color: #2E7D32;
  display: block;
  margin-bottom: 8px;
}

.profile-item span {
  color: #666;
  line-height: 1.6;
}

.profile-image {
  display: flex;
  justify-content: center;
}

.award-img {
  width: 250px;
  height: 300px;
  border-radius: 10px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
  object-fit: cover;
}

@media (max-width: 768px) {
  .hero-section h1 {
    font-size: 32px;
  }
  
  .intro-content,
  .profile-content {
    grid-template-columns: 1fr;
    gap: 30px;
  }
  
  .company-img,
  .award-img {
    width: 200px;
    height: 200px;
  }
  
  .values-list {
    grid-template-columns: 1fr;
  }
}
</style>