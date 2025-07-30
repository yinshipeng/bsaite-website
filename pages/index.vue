<template>
  <div class="pt-20">
    <!-- Hero Section -->
    <section class="bg-gradient-to-br from-blue-700 via-blue-600 to-blue-500 relative overflow-hidden min-h-[70vh] flex items-center">
      <!-- 背景图片 -->
      <div class="absolute inset-0 z-0">
        <img 
          src="https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=1200&h=800&fit=crop&crop=entropy&auto=format&q=75" 
          alt="农业种植背景" 
          class="w-full h-full object-cover opacity-20"
        />
        <div class="absolute inset-0 bg-gradient-to-br from-blue-700/80 via-blue-600/80 to-blue-500/80"></div>
      </div>
      <div class="container mx-auto px-4 relative z-10">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          <div class="text-white fade-in-up">
            <h1 class="text-4xl md:text-6xl font-bold mb-6 leading-tight">
              专业农业<br>
              <span class="text-white drop-shadow-lg">进出口贸易</span>
            </h1>
            <p class="text-xl mb-8 text-blue-100 leading-relaxed font-medium">
              芭赛特进出口(商丘)有限公司致力于为客户提供优质的肥料产品和农业解决方案，
              助力现代农业发展。
            </p>
            <div class="flex flex-col sm:flex-row gap-4">
              <UButton 
                color="white" 
                variant="solid" 
                size="lg"
                :ui="{ rounded: 'rounded-full' }"
                @click="scrollToProducts"
              >
                <UIcon name="i-heroicons-eye" class="w-5 h-5 mr-2" />
                了解产品
              </UButton>
              <UButton 
                color="white" 
                variant="outline" 
                size="lg"
                :ui="{ rounded: 'rounded-full' }"
                to="/contact"
              >
                <UIcon name="i-heroicons-phone" class="w-5 h-5 mr-2" />
                联系我们
              </UButton>
            </div>
          </div>
          
          <div class="hidden lg:flex justify-center">
            <div class="w-96 h-96 bg-white bg-opacity-10 rounded-full flex items-center justify-center backdrop-blur-sm overflow-hidden">
              <img 
                src="https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=400&fit=crop&crop=entropy&auto=format&q=75" 
                alt="绿色农田植物" 
                class="w-80 h-80 rounded-full object-cover"
              />
            </div>
          </div>
        </div>
      </div>
      
      <!-- 滚动指示器 -->
      <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 text-white animate-bounce">
        <UIcon name="i-heroicons-chevron-down" class="w-6 h-6" />
      </div>
    </section>

    <!-- 特色服务 -->
    <section class="py-20 bg-gray-50">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16 fade-in-up">
          <h2 class="text-3xl md:text-4xl font-bold mb-4 text-gray-800">
            我们的优势
          </h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto">
            凭借专业的技术团队和丰富的行业经验，为客户提供全方位的服务
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          <div 
            v-for="(feature, index) in features" 
            :key="index"
            class="modern-card p-8 text-center group"
          >
            <div class="feature-icon group-hover:scale-110 transition-transform duration-300">
              <UIcon :name="feature.icon" class="w-8 h-8" />
            </div>
            <h3 class="text-xl font-semibold mb-3 text-gray-800">{{ feature.title }}</h3>
            <p class="text-gray-600 leading-relaxed">{{ feature.description }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- 产品展示 -->
    <section id="products" class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16 fade-in-up">
          <h2 class="text-3xl md:text-4xl font-bold mb-4 text-gray-800">
            产品中心
          </h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto">
            提供多元化的农业产品，满足不同客户需求
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <div 
            v-for="(product, index) in products" 
            :key="index"
            class="modern-card overflow-hidden group hover:shadow-xl transition-all duration-300"
          >
            <div class="h-48 bg-gradient-to-br from-blue-50 to-blue-100 flex items-center justify-center overflow-hidden">
              <img 
                :src="product.image" 
                :alt="product.name" 
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
              />
            </div>
            <div class="p-6">
              <h3 class="text-xl font-semibold mb-3 text-gray-800">{{ product.name }}</h3>
              <p class="text-gray-600 mb-4 leading-relaxed text-sm">{{ product.description }}</p>
              <UButton 
                color="blue" 
                variant="outline" 
                size="sm"
                to="/products"
                class="w-full justify-center"
              >
                了解更多
              </UButton>
            </div>
          </div>
        </div>

        <div class="text-center mt-12">
          <UButton 
            color="blue" 
            variant="solid" 
            size="lg"
            to="/products"
          >
            查看全部产品
          </UButton>
        </div>
      </div>
    </section>

    <!-- 公司简介 -->
    <section class="py-20 bg-gray-50">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          <div class="fade-in-up">
            <h2 class="text-3xl md:text-4xl font-bold mb-6 text-gray-800">
              关于芭赛特
            </h2>
            <p class="text-gray-600 text-lg leading-relaxed mb-6">
              芭赛特进出口（商丘）有限公司成立于2025年3月，是一家专业从事农业相关产品进出口贸易的现代化企业。
              公司注册资本100万元，位于河南省商丘市民权县，主要经营范围包括货物进出口、肥料销售、
              化工产品生产与销售等。
            </p>
            <p class="text-gray-600 text-lg leading-relaxed mb-8">
              我们致力于为客户提供优质的农业解决方案，通过技术创新和服务优化，
              助力现代农业发展，促进农业产业升级。
            </p>
            <UButton 
              color="blue" 
              variant="solid" 
              size="lg"
              to="/about"
            >
              了解更多
            </UButton>
          </div>
          
          <div class="relative">
            <div class="w-full h-96 bg-gradient-to-br from-blue-50 to-gray-100 rounded-2xl overflow-hidden">
              <img 
                src="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=600&h=400&fit=crop&crop=entropy&auto=format&q=75" 
                alt="现代办公建筑" 
                class="w-full h-full object-cover"
              />
            </div>
            <div class="absolute -bottom-4 -right-4 w-24 h-24 bg-blue-600 rounded-full flex items-center justify-center">
              <UIcon name="i-heroicons-check" class="w-12 h-12 text-white" />
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 新闻资讯 -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16 fade-in-up">
          <h2 class="text-3xl md:text-4xl font-bold mb-4 text-gray-800">
            新闻资讯
          </h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto">
            关注行业动态，了解最新资讯
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div 
            v-for="(news, index) in newsItems" 
            :key="index"
            class="modern-card overflow-hidden group"
          >
            <div class="h-48 bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center overflow-hidden">
              <img 
                :src="news.image" 
                :alt="news.title" 
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
              />
            </div>
            <div class="p-6">
              <div class="text-sm text-gray-500 mb-2">{{ news.date }}</div>
              <h3 class="text-lg font-semibold mb-3 text-gray-800">{{ news.title }}</h3>
              <p class="text-gray-600 text-sm leading-relaxed">{{ news.summary }}</p>
            </div>
          </div>
        </div>

        <div class="text-center mt-12">
          <UButton 
            color="blue" 
            variant="solid" 
            size="lg"
            to="/news"
          >
            查看全部新闻
          </UButton>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="py-20 bg-gradient-to-br from-blue-700 via-blue-600 to-blue-500 text-white">
      <div class="container mx-auto px-4 text-center">
        <h2 class="text-3xl md:text-4xl font-bold mb-6 text-white drop-shadow-md">
          让我们携手共创农业美好未来
        </h2>
        <p class="text-xl mb-8 text-blue-50 max-w-3xl mx-auto leading-relaxed">
          如果您对我们的产品和服务感兴趣，欢迎随时联系我们。
          我们将为您提供专业的解决方案和优质的服务。
        </p>
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
          <UButton 
            color="white" 
            variant="solid" 
            size="lg"
            :ui="{ rounded: 'rounded-full' }"
            to="/contact"
          >
            <UIcon name="i-heroicons-phone" class="w-5 h-5 mr-2" />
            立即联系
          </UButton>
          <UButton 
            color="white" 
            variant="outline" 
            size="lg"
            :ui="{ rounded: 'rounded-full' }"
            to="/products"
          >
            <UIcon name="i-heroicons-eye" class="w-5 h-5 mr-2" />
            查看产品
          </UButton>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
useHead({
  title: '首页',
  meta: [
    { name: 'description', content: '芭赛特进出口(商丘)有限公司专业从事农业进出口贸易，提供优质的肥料产品和农业解决方案' }
  ]
})

const features = [
  {
    icon: 'i-heroicons-cog-6-tooth',
    title: '技术研发',
    description: '拥有专业的技术团队和完备的研发基地，不断创新产品技术'
  },
  {
    icon: 'i-heroicons-beaker',
    title: '品质保证',
    description: '严格的质量监控体系，确保产品的安全性、有效性和稳定性'
  },
  {
    icon: 'i-heroicons-users',
    title: '专业服务',
    description: '客户为先的服务理念，提供专业的技术支持和售后服务'
  },
  {
    icon: 'i-heroicons-globe-asia-australia',
    title: '国际合作',
    description: '与多个国家建立合作关系，拥有丰富的国际贸易经验'
  }
]

const products = [
  {
    icon: 'i-heroicons-beaker',
    name: '肥料销售',
    description: '提供各类优质肥料产品，满足不同作物的营养需求',
    image: 'https://images.unsplash.com/photo-1616431640305-8b3b20e6e8c6?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    icon: 'i-heroicons-beaker',
    name: '化工产品',
    description: '生产和销售优质化工产品，服务于农业和工业领域',
    image: 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    icon: 'i-heroicons-cpu-chip',
    name: '复合微生物肥料',
    description: '研发生产新型复合微生物肥料，提高土壤肥力',
    image: 'https://images.unsplash.com/photo-1464207687429-7505649dae38?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    icon: 'i-heroicons-cog',
    name: '技术服务',
    description: '提供技术开发、咨询、转让等全方位技术服务',
    image: 'https://images.unsplash.com/photo-1560472355-536de3962603?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  }
]

const newsItems = [
  {
    date: '2025-01-15',
    title: '现代农业发展新趋势',
    summary: '随着科技的不断进步，现代农业正朝着智能化、绿色化方向发展...',
    image: 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    date: '2025-01-10',
    title: '肥料行业市场分析',
    summary: '2025年肥料行业面临新的机遇和挑战，市场需求呈现多元化趋势...',
    image: 'https://images.unsplash.com/photo-1464207687429-7505649dae38?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    date: '2025-01-05',
    title: '芭赛特公司成立',
    summary: '芭赛特进出口(商丘)有限公司正式成立，致力于农业进出口贸易...',
    image: 'https://images.unsplash.com/photo-1592921870789-04563d55041c?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  }
]

function scrollToProducts() {
  document.getElementById('products')?.scrollIntoView({ 
    behavior: 'smooth' 
  })
}
</script>
