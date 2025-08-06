<template>
  <div class="products">
    <section class="hero-section">
      <div class="container">
        <h1>产品中心</h1>
        <p>芭赛特优质农业产品展示</p>
      </div>
    </section>

    <section class="products-showcase">
      <div class="container">
        <div class="section-title">
          <span class="title-decoration">◇</span>
          <h2>产品展示</h2>
          <span class="title-decoration">◇</span>
        </div>
        
        <div class="product-categories">
          <div class="category" :class="{ active: activeCategory === 'all' }" @click="setActiveCategory('all')">全部产品</div>
          <div class="category" :class="{ active: activeCategory === '海藻矿源氨基酸水溶肥料' }" @click="setActiveCategory('海藻矿源氨基酸水溶肥料')">海藻矿源氨基酸水溶肥料</div>
          <div class="category" :class="{ active: activeCategory === '海藻矿源冲施肥' }" @click="setActiveCategory('海藻矿源冲施肥')">海藻矿源冲施肥</div>
          <div class="category" :class="{ active: activeCategory === '海藻矿源滴灌专用肥' }" @click="setActiveCategory('海藻矿源滴灌专用肥')">海藻矿源滴灌专用肥</div>
          <div class="category" :class="{ active: activeCategory === '进口磷钾产品套装' }" @click="setActiveCategory('进口磷钾产品套装')">进口磷钾产品套装</div>
        </div>

        <div class="products-grid">
          <div class="product-card" v-for="(product, index) in filteredProducts" :key="index">
            <div class="product-image">
              <img :src="product.image" :alt="product.name" class="product-img" />
              <div class="product-badge" v-if="product.isNew">新品</div>
            </div>
            <div class="product-info">
              <h3>{{ product.name }}</h3>
              <p>{{ product.description }}</p>
              <div class="product-specs">
                <span>规格: {{ product.spec }}</span>
                <span>类型: {{ product.type }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
const activeCategory = ref('all')

const allProducts = [
  {
    name: '海藻矿源氨基酸水溶肥料-高氮型',
    description: '富含海藻提取物和多种氨基酸，有效提高作物品质和产量',
    spec: '25kg',
    type: '高氮配方',
    price: '168',
    image: 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=400&h=300&fit=crop&crop=center',
    isNew: true,
    category: '海藻矿源氨基酸水溶肥料'
  },
  {
    name: '海藻矿源氨基酸水溶肥料-高磷型',
    description: '专业花期使用，促进开花结果，提高产量和品质',
    spec: '25kg',
    type: '高磷配方',
    price: '175',
    image: 'https://images.unsplash.com/photo-1586864387967-d02ef85d93e8?w=400&h=300&fit=crop&crop=center',
    isNew: false,
    category: '海藻矿源氨基酸水溶肥料'
  },
  {
    name: '海藻矿源氨基酸水溶肥料-高钾型',
    description: '促进根系发达，增强植物抗逆性，提高产量',
    spec: '25kg',
    type: '高钾配方',
    price: '180',
    image: 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=400&h=300&fit=crop&crop=center',
    isNew: false,
    category: '海藻矿源氨基酸水溶肥料'
  },
  {
    name: '海藻矿源冲施肥-平衡型',
    description: '适合水肥一体化使用，平衡营养，促进健康生长',
    spec: '20kg',
    type: '平衡配方',
    price: '145',
    image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=300&fit=crop&crop=center',
    isNew: false,
    category: '海藻矿源冲施肥'
  },
  {
    name: '海藻矿源冲施肥-生根型',
    description: '富含生根激素，促进根系发达，提高吸收效率',
    spec: '20kg',
    type: '生根配方',
    price: '155',
    image: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=400&h=300&fit=crop&crop=center',
    isNew: true,
    category: '海藻矿源冲施肥'
  },
  {
    name: '海藻矿源滴灌专用肥-精装',
    description: '专为滴灌设备设计，溶解性好，不堵塞管道',
    spec: '10kg',
    type: '滴灌专用',
    price: '98',
    image: 'https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?w=400&h=300&fit=crop&crop=center',
    isNew: false,
    category: '海藻矿源滴灌专用肥'
  },
  {
    name: '进口磷钾产品套装-A型',
    description: '进口磷钾合理搭配，提高作物品质和产量',
    spec: '50kg',
    type: '进口原料',
    price: '320',
    image: 'https://images.unsplash.com/photo-1464226184884-fa280b87c399?w=400&h=300&fit=crop&crop=center',
    isNew: false,
    category: '进口磷钾产品套装'
  },
  {
    name: '进口磷钾产品套装-B型',
    description: '高浓度磷钾配方，适合经济作物使用',
    spec: '50kg',
    type: '进口原料',
    price: '350',
    image: 'https://images.unsplash.com/photo-1560493676-04071c5f467b?w=400&h=300&fit=crop&crop=center',
    isNew: true,
    category: '进口磷钾产品套装'
  },
  {
    name: '有机无机复合肥-综合型',
    description: '有机质与无机营养合理搭配，改良土壤结构',
    spec: '40kg',
    type: '复合配方',
    price: '280',
    image: 'https://images.unsplash.com/photo-1605000797499-95a51c5269ae?w=400&h=300&fit=crop&crop=center',
    isNew: false,
    category: '其他产品'
  },
  {
    name: '海藻精-生物刺激素',
    description: '纯天然海藻提取，富含多种植物生长调节剂',
    spec: '5kg',
    type: '生物刺激',
    price: '220',
    image: 'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?w=400&h=300&fit=crop&crop=center',
    isNew: true,
    category: '其他产品'
  },
  {
    name: '中微量元素肥料-精装',
    description: '富含硼、锰、硫等中微量元素，防治缺素症',
    spec: '15kg',
    type: '中微量元素',
    price: '185',
    image: 'https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?w=400&h=300&fit=crop&crop=center',
    isNew: false,
    category: '其他产品'
  },
  {
    name: '土壤调理剂-改良型',
    description: '改善土壤酸碱度，提高土壤肥力和保水性',
    spec: '25kg',
    type: '土壤改良',
    price: '120',
    image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=300&fit=crop&crop=center',
    isNew: false,
    category: '其他产品'
  }
]

const filteredProducts = computed(() => {
  if (activeCategory.value === 'all') {
    return allProducts
  }
  return allProducts.filter(product => product.category === activeCategory.value)
})

const setActiveCategory = (category) => {
  activeCategory.value = category
}
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

.products-showcase {
  padding: 60px 0;
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

.product-categories {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 15px;
  margin-bottom: 40px;
}

.category {
  padding: 10px 20px;
  border: 2px solid #4CAF50;
  background: white;
  color: #4CAF50;
  border-radius: 25px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.category:hover,
.category.active {
  background: #4CAF50;
  color: white;
}

.products-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 30px;
}

.product-card {
  background: white;
  border-radius: 15px;
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
}

.product-card:hover {
  transform: translateY(-10px);
}

.product-image {
  height: 250px;
  position: relative;
  overflow: hidden;
}

.product-badge {
  position: absolute;
  top: 10px;
  right: 10px;
  background: #FF5722;
  color: white;
  padding: 5px 10px;
  border-radius: 15px;
  font-size: 12px;
  font-weight: 600;
  z-index: 1;
}

.product-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.product-card:hover .product-img {
  transform: scale(1.05);
}

.product-info {
  padding: 25px 20px;
}

.product-info h3 {
  font-size: 16px;
  color: #2E7D32;
  margin-bottom: 10px;
  font-weight: 600;
  line-height: 1.4;
}

.product-info p {
  color: #666;
  margin-bottom: 15px;
  line-height: 1.6;
  font-size: 14px;
}

.product-specs {
  display: flex;
  gap: 10px;
  margin-bottom: 15px;
  flex-wrap: wrap;
}

.product-specs span {
  background: #E8F5E8;
  color: #2E7D32;
  padding: 5px 12px;
  border-radius: 15px;
  font-size: 12px;
  font-weight: 500;
}

.product-price {
  display: flex;
  align-items: baseline;
  gap: 5px;
  padding-top: 15px;
  border-top: 1px solid #eee;
}

.price {
  font-size: 18px;
  font-weight: 700;
  color: #FF5722;
}

.unit {
  font-size: 12px;
  color: #999;
}
</style>