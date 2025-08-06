<template>
  <div class="contact-page">
    <section class="hero-section">
      <div class="hero-background"></div>
      <div class="container">
        <h1>联系我们</h1>
        <p>期待与您的合作，共同发展绿色农业</p>
      </div>
    </section>

    <section class="contact-section">
      <div class="container">
        <div class="section-title">
          <span class="title-decoration">◇</span>
          <h2>联系方式</h2>
          <span class="title-decoration">◇</span>
        </div>
        
        <div class="contact-content">
          <div class="contact-info">
            <div class="company-card">
              <div class="company-logo">
                <img src="/logo.svg" alt="芭赛特公司标志" />
              </div>
              <h3>芭赛特进出口（商丘）有限公司</h3>
              <p>Basaite Import and Export (Shangqiu) Group Co., Ltd.</p>
            </div>
            
            <div class="info-list">
              <div class="info-item">
                <div class="info-icon address">
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z" fill="white"/>
                  </svg>
                </div>
                <div>
                  <strong>公司地址</strong>
                  <p>河南省商丘市民权县绿洲街道办事处庄周大道东段北侧2-1号</p>
                </div>
              </div>
              
              <div class="info-item">
                <div class="info-icon phone">
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M6.62 10.79c1.44 2.83 3.76 5.14 6.59 6.59l2.2-2.2c.27-.27.67-.36 1.02-.24 1.12.37 2.33.57 3.57.57.55 0 1 .45 1 1V20c0 .55-.45 1-1 1-9.39 0-17-7.61-17-17 0-.55.45-1 1-1h3.5c.55 0 1 .45 1 1 0 1.25.2 2.45.57 3.57.11.35.03.74-.25 1.02l-2.2 2.2z" fill="white"/>
                  </svg>
                </div>
                <div>
                  <strong>联系电话</strong>
                  <p>400-0563-118</p>
                  <p>工作时间：周一至周五 8:00-18:00</p>
                </div>
              </div>
              
              <div class="info-item">
                <div class="info-icon email">
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.89 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z" fill="white"/>
                  </svg>
                </div>
                <div>
                  <strong>电子邮箱</strong>
                  <p>contact@bsaite.cn</p>
                  <p>sales@bsaite.cn</p>
                </div>
              </div>
              
              <div class="info-item">
                <div class="info-icon website">
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.94-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z" fill="white"/>
                  </svg>
                </div>
                <div>
                  <strong>公司官网</strong>
                  <p>www.bsaite.cn</p>
                  <p>统一社会信用代码：91411421MAEF5J2U3T</p>
                </div>
              </div>
            </div>
          </div>

          <div class="contact-form">
            <h3>在线留言</h3>
            <p class="form-desc">请填写以下信息，我们将尽快与您联系</p>
            <form @submit.prevent="submitForm">
              <div class="form-row">
                <div class="form-group">
                  <label>姓名 *</label>
                  <input type="text" v-model="form.name" placeholder="请输入您的姓名" required>
                </div>
                <div class="form-group">
                  <label>联系电话 *</label>
                  <input type="tel" v-model="form.phone" placeholder="请输入联系电话" required>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group">
                  <label>电子邮箱</label>
                  <input type="email" v-model="form.email" placeholder="请输入电子邮箱">
                </div>
                <div class="form-group">
                  <label>公司名称</label>
                  <input type="text" v-model="form.company" placeholder="请输入公司名称">
                </div>
              </div>
              <div class="form-group">
                <label>留言内容 *</label>
                <textarea v-model="form.message" placeholder="请输入您的留言内容，如产品咨询、合作意向等" rows="5" required></textarea>
              </div>
              <button type="submit" class="submit-btn">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M2.01 21L23 12 2.01 3 2 10l15 2-15 2z" fill="white"/>
                </svg>
                发送留言
              </button>
            </form>
          </div>
        </div>
      </div>
    </section>
    
    <section class="business-hours">
      <div class="container">
        <div class="hours-content">
          <div class="hours-info">
            <h3>营业时间</h3>
            <div class="hours-list">
              <div class="hour-item">
                <span>周一 - 周五</span>
                <span>8:00 - 18:00</span>
              </div>
              <div class="hour-item">
                <span>周六</span>
                <span>9:00 - 17:00</span>
              </div>
              <div class="hour-item">
                <span>周日</span>
                <span>休息</span>
              </div>
            </div>
          </div>
          <div class="business-image">
            <img src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=400&h=300&fit=crop&crop=center" alt="业务时间" />
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
const form = ref({
  name: '',
  phone: '',
  email: '',
  company: '',
  message: ''
})

const submitForm = () => {
  alert('感谢您的留言，我们会尽快与您联系！')
  // Reset form
  form.value = {
    name: '',
    phone: '',
    email: '',
    company: '',
    message: ''
  }
}
</script>

<style scoped>
.contact-page {
  width: 100%;
  min-height: 100vh;
}

.hero-section {
  position: relative;
  background: linear-gradient(135deg, #4CAF50, #2E7D32);
  color: white;
  padding: 80px 0;
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
              url('https://images.unsplash.com/photo-1556761175-b413da4baf72?w=1920&h=600&fit=crop&crop=center');
  background-size: cover;
  background-position: center;
  z-index: -1;
}

.hero-section h1 {
  font-size: 48px;
  margin-bottom: 15px;
  font-weight: 700;
}

.hero-section p {
  font-size: 20px;
  opacity: 0.95;
}

.contact-section {
  padding: 80px 0;
  background: #f8f9fa;
}

.section-title {
  text-align: center;
  margin-bottom: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 20px;
}

.section-title h2 {
  font-size: 32px;
  color: #2E7D32;
  margin: 0;
}

.title-decoration {
  color: #4CAF50;
  font-size: 28px;
}

.contact-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 60px;
  align-items: start;
}

.company-card {
  background: white;
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
  text-align: center;
  margin-bottom: 30px;
}

.company-logo {
  width: 80px;
  height: 80px;
  margin: 0 auto 20px;
  border-radius: 50%;
  background: linear-gradient(135deg, #4CAF50, #2E7D32);
  display: flex;
  align-items: center;
  justify-content: center;
}

.company-logo img {
  width: 50px;
  height: 50px;
}

.company-card h3 {
  font-size: 20px;
  color: #2E7D32;
  margin-bottom: 10px;
}

.company-card p {
  color: #666;
  font-size: 14px;
}

.info-list {
  display: flex;
  flex-direction: column;
  gap: 25px;
}

.info-item {
  display: flex;
  align-items: flex-start;
  gap: 20px;
  background: white;
  padding: 25px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0,0,0,0.08);
  transition: transform 0.3s ease;
}

.info-item:hover {
  transform: translateY(-2px);
}

.info-icon {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background: linear-gradient(135deg, #4CAF50, #2E7D32);
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.info-item strong {
  display: block;
  color: #2E7D32;
  font-size: 16px;
  margin-bottom: 8px;
  font-weight: 600;
}

.info-item p {
  color: #666;
  line-height: 1.6;
  margin: 0;
  font-size: 14px;
}

.contact-form {
  background: white;
  padding: 40px;
  border-radius: 20px;
  box-shadow: 0 20px 40px rgba(0,0,0,0.1);
}

.contact-form h3 {
  font-size: 24px;
  color: #2E7D32;
  margin-bottom: 10px;
}

.form-desc {
  color: #666;
  margin-bottom: 30px;
  font-size: 14px;
}

.form-row {
  display: flex;
  gap: 20px;
  margin-bottom: 25px;
}

.form-group {
  flex: 1;
}

.form-group label {
  display: block;
  color: #333;
  font-weight: 500;
  margin-bottom: 8px;
  font-size: 14px;
}

.contact-form input,
.contact-form textarea {
  width: 100%;
  padding: 15px;
  border: 2px solid #e9ecef;
  border-radius: 10px;
  font-size: 14px;
  transition: all 0.3s ease;
  font-family: inherit;
}

.contact-form input:focus,
.contact-form textarea:focus {
  outline: none;
  border-color: #4CAF50;
  box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
}

.submit-btn {
  background: linear-gradient(135deg, #4CAF50, #2E7D32);
  color: white;
  border: none;
  padding: 15px 30px;
  border-radius: 10px;
  cursor: pointer;
  font-size: 16px;
  font-weight: 600;
  width: 100%;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
}

.submit-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 25px rgba(76, 175, 80, 0.3);
}

.business-hours {
  padding: 60px 0;
  background: white;
}

.hours-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 40px;
  align-items: center;
}

.hours-info h3 {
  font-size: 24px;
  color: #2E7D32;
  margin-bottom: 25px;
}

.hours-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.hour-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 20px;
  background: #f8f9fa;
  border-radius: 10px;
  border-left: 4px solid #4CAF50;
}

.hour-item span:first-child {
  font-weight: 500;
  color: #333;
}

.hour-item span:last-child {
  color: #4CAF50;
  font-weight: 600;
}

.business-image img {
  width: 100%;
  height: 300px;
  object-fit: cover;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
}

@media (max-width: 768px) {
  .contact-content,
  .hours-content {
    grid-template-columns: 1fr;
    gap: 40px;
  }
  
  .form-row {
    flex-direction: column;
    gap: 15px;
  }
  
  .hero-section h1 {
    font-size: 32px;
  }
  
  .section-title h2 {
    font-size: 24px;
  }
  
  .contact-form {
    padding: 25px;
  }
}
</style>