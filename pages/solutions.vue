<template>
  <div class="solutions">
    <section class="hero-section">
      <div class="container">
        <h1>解决方案</h1>
        <p>专业的农业技术解决方案</p>
      </div>
    </section>

    <section class="solutions-content">
      <div class="container">
        <div class="solutions-grid">
          <div class="solution-card">
            <div class="solution-icon crop">
              <img src="https://images.unsplash.com/photo-1500937386664-56d1dfef3854?w=100&h=100&fit=crop&crop=center" alt="作物营养" class="solution-img" />
            </div>
            <h3>作物营养方案</h3>
            <p>针对不同作物的生长特点，提供专业的营养配方和施肥指导，确保作物健康生长。</p>
            <ul>
              <li>个性化营养配方</li>
              <li>科学施肥指导</li>
              <li>全程技术跟踪</li>
            </ul>
          </div>

          <div class="solution-card">
            <div class="solution-icon soil">
              <img src="https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=100&h=100&fit=crop&crop=center" alt="土壤改良" class="solution-img" />
            </div>
            <h3>土壤改良方案</h3>
            <p>通过土壤检测分析，制定针对性的土壤改良计划，提升土壤肥力和作物产量。</p>
            <ul>
              <li>土壤成分检测</li>
              <li>改良方案制定</li>
              <li>效果跟踪评估</li>
            </ul>
          </div>

          <div class="solution-card">
            <div class="solution-icon growth">
              <img src="https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?w=100&h=100&fit=crop&crop=center" alt="增产增收" class="solution-img" />
            </div>
            <h3>增产增收方案</h3>
            <p>结合先进的农业技术和产品，帮助农户实现作物增产增收的目标。</p>
            <ul>
              <li>产量提升技术</li>
              <li>品质改善方案</li>
              <li>成本控制优化</li>
            </ul>
          </div>

          <div class="solution-card">
            <div class="solution-icon organic">
              <img src="https://images.unsplash.com/photo-1464226184884-fa280b87c399?w=100&h=100&fit=crop&crop=center" alt="有机农业" class="solution-img" />
            </div>
            <h3>有机农业方案</h3>
            <p>提供有机农业生产的全套解决方案，助力绿色农业发展。</p>
            <ul>
              <li>有机认证指导</li>
              <li>生态种植技术</li>
              <li>病虫害绿色防控</li>
            </ul>
          </div>

          <div class="solution-card">
            <div class="solution-icon tech">
              <img src="https://images.unsplash.com/photo-1560493676-04071c5f467b?w=100&h=100&fit=crop&crop=center" alt="智慧农业" class="solution-img" />
            </div>
            <h3>智慧农业方案</h3>
            <p>运用现代信息技术，为农业生产提供智能化管理方案。</p>
            <ul>
              <li>精准农业技术</li>
              <li>智能监测系统</li>
              <li>数据分析服务</li>
            </ul>
          </div>

          <div class="solution-card">
            <div class="solution-icon service">
              <img src="https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?w=100&h=100&fit=crop&crop=center" alt="技术服务" class="solution-img" />
            </div>
            <h3>技术服务方案</h3>
            <p>提供全方位的农业技术服务，包括培训、咨询、指导等。</p>
            <ul>
              <li>技术培训服务</li>
              <li>专家咨询指导</li>
              <li>现场技术支持</li>
            </ul>
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

.solutions-content {
  padding: 60px 0;
}

.solutions-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 30px;
}

.solution-card {
  background: white;
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
  text-align: center;
  transition: transform 0.3s ease;
}

.solution-card:hover {
  transform: translateY(-10px);
}

.solution-icon {
  width: 80px;
  height: 80px;
  margin: 0 auto 20px;
  border-radius: 50%;
  background: linear-gradient(135deg, #4CAF50, #2E7D32);
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.solution-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 50%;
}

.solution-card h3 {
  font-size: 20px;
  color: #2E7D32;
  margin-bottom: 15px;
}

.solution-card p {
  color: #666;
  line-height: 1.6;
  margin-bottom: 20px;
}

.solution-card ul {
  list-style: none;
  padding: 0;
  text-align: left;
}

.solution-card li {
  color: #555;
  margin-bottom: 8px;
  padding-left: 20px;
  position: relative;
}

.solution-card li:before {
  content: "✓";
  color: #4CAF50;
  font-weight: bold;
  position: absolute;
  left: 0;
}

@media (max-width: 768px) {
  .solutions-grid {
    grid-template-columns: 1fr;
  }
  
  .hero-section h1 {
    font-size: 32px;
  }
}
</style>