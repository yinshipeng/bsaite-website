<template>
  <div class="pt-20">
    <!-- 页面头部 -->
    <section class="bg-gradient-to-br from-blue-700 via-blue-600 to-blue-500 text-white py-20">
      <div class="container mx-auto px-4 text-center">
        <h1 class="text-4xl md:text-5xl font-bold mb-4 text-white drop-shadow-md">产品中心</h1>
        <p class="text-xl text-blue-100">专业的农业产品，满足您的各种需求</p>
      </div>
    </section>

    <!-- 产品分类 -->
    <section class="py-8 bg-white sticky top-20 z-40 border-b">
      <div class="container mx-auto px-4">
        <div class="flex flex-wrap justify-center gap-4">
          <UButton 
            v-for="category in categories" 
            :key="category.id"
            :color="selectedCategory === category.id ? 'blue' : 'gray'"
            :variant="selectedCategory === category.id ? 'solid' : 'outline'"
            size="sm"
            @click="selectedCategory = category.id"
          >
            {{ category.name }}
          </UButton>
        </div>
      </div>
    </section>

    <!-- 产品展示 -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div 
            v-for="product in filteredProducts" 
            :key="product.id"
            class="modern-card overflow-hidden group cursor-pointer hover:shadow-xl transition-all duration-300"
            @click="selectedProduct = product"
          >
            <div class="h-48 bg-gradient-to-br from-blue-50 to-blue-100 flex items-center justify-center overflow-hidden">
              <img 
                :src="product.image" 
                :alt="product.name" 
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
              />
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-2">
                <span class="text-xs px-2 py-1 bg-blue-100 text-blue-700 rounded-full">
                  {{ getCategoryName(product.category) }}
                </span>
                <UBadge color="gray" variant="soft" size="xs">
                  热销
                </UBadge>
              </div>
              <h3 class="text-xl font-semibold mb-3 text-gray-800">{{ product.name }}</h3>
              <p class="text-gray-600 mb-4 leading-relaxed text-sm">{{ product.description }}</p>
              <div class="flex items-center justify-between">
                <div class="text-sm text-gray-500">
                  规格：{{ product.specification }}
                </div>
                <UButton 
                  color="blue" 
                  variant="outline" 
                  size="xs"
                >
                  了解详情
                </UButton>
              </div>
            </div>
          </div>
        </div>

        <!-- 没有产品时的提示 -->
        <div v-if="filteredProducts.length === 0" class="text-center py-20">
          <UIcon name="i-heroicons-inbox" class="w-16 h-16 text-gray-400 mx-auto mb-4" />
          <p class="text-gray-500 text-lg">该分类下暂无产品</p>
        </div>
      </div>
    </section>

    <!-- 产品特点 -->
    <section class="py-20 bg-gray-50">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16">
          <h2 class="text-3xl font-bold text-gray-800 mb-4">产品特点</h2>
          <p class="text-xl text-gray-600">为什么选择芭赛特的产品</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          <div 
            v-for="feature in productFeatures" 
            :key="feature.title"
            class="modern-card p-6 text-center"
          >
            <div class="w-16 h-16 bg-gradient-to-br from-blue-600 to-blue-700 rounded-full flex items-center justify-center mx-auto mb-4">
              <UIcon :name="feature.icon" class="w-8 h-8 text-white" />
            </div>
            <h3 class="text-lg font-semibold mb-2 text-gray-800">{{ feature.title }}</h3>
            <p class="text-gray-600">{{ feature.description }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- 产品详情弹窗 -->
    <UModal v-model="showProductDetail">
      <UCard v-if="selectedProduct">
        <template #header>
          <div class="flex items-center justify-between">
            <h3 class="text-lg font-semibold">{{ selectedProduct.name }}</h3>
            <UButton 
              color="gray" 
              variant="ghost" 
              size="sm"
              @click="showProductDetail = false"
            >
              <UIcon name="i-heroicons-x-mark" class="w-5 h-5" />
            </UButton>
          </div>
        </template>
        
        <div class="space-y-6">
          <!-- 产品图标 -->
          <div class="text-center">
            <div class="w-24 h-24 bg-blue-50 rounded-full flex items-center justify-center mx-auto mb-4 overflow-hidden">
              <img 
                :src="selectedProduct.image" 
                :alt="selectedProduct.name" 
                class="w-full h-full object-cover rounded-full"
              />
            </div>
            <UBadge color="blue" variant="soft">
              {{ getCategoryName(selectedProduct.category) }}
            </UBadge>
          </div>

          <!-- 产品信息 -->
          <div class="space-y-4">
            <div>
              <h4 class="font-semibold text-gray-800 mb-2">产品描述</h4>
              <p class="text-gray-600 leading-relaxed">{{ selectedProduct.description }}</p>
            </div>
            
            <div>
              <h4 class="font-semibold text-gray-800 mb-2">产品规格</h4>
              <p class="text-gray-600">{{ selectedProduct.specification }}</p>
            </div>
            
            <div v-if="selectedProduct.features">
              <h4 class="font-semibold text-gray-800 mb-2">主要特点</h4>
              <ul class="space-y-2">
                <li 
                  v-for="feature in selectedProduct.features" 
                  :key="feature"
                  class="flex items-center text-gray-600"
                >
                  <UIcon name="i-heroicons-check-circle" class="w-4 h-4 text-blue-600 mr-2" />
                  {{ feature }}
                </li>
              </ul>
            </div>
          </div>
        </div>

        <template #footer>
          <div class="flex justify-between">
            <UButton 
              color="gray" 
              variant="outline"
              @click="showProductDetail = false"
            >
              关闭
            </UButton>
            <UButton 
              color="blue" 
              variant="solid"
              to="/contact"
            >
              立即咨询
            </UButton>
          </div>
        </template>
      </UCard>
    </UModal>
  </div>
</template>

<script setup>
useHead({
  title: '产品中心',
  meta: [
    { name: 'description', content: '芭赛特进出口(商丘)有限公司产品中心，提供优质的肥料、化工产品等农业解决方案' }
  ]
})

const selectedCategory = ref('all')
const selectedProduct = ref(null)
const showProductDetail = computed(() => !!selectedProduct.value)

const categories = [
  { id: 'all', name: '全部产品' },
  { id: 'fertilizer', name: '肥料销售' },
  { id: 'chemical', name: '化工产品' },
  { id: 'microbial', name: '微生物肥料' },
  { id: 'technical', name: '技术服务' }
]

const products = [
  {
    id: 1,
    name: '复合肥料',
    category: 'fertilizer',
    icon: 'i-heroicons-beaker',
    description: '高品质复合肥料，含有作物所需的多种营养元素，能有效提高作物产量和品质。',
    specification: '25kg/袋、50kg/袋',
    features: ['营养均衡', '吸收率高', '环保安全', '增产明显'],
    image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    id: 2,
    name: '有机肥料',
    category: 'fertilizer',
    icon: 'i-heroicons-leaf',
    description: '纯天然有机肥料，改善土壤结构，提高土壤肥力，促进作物健康生长。',
    specification: '20kg/袋、40kg/袋',
    features: ['纯天然', '改良土壤', '持效期长', '安全无害'],
    image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    id: 3,
    name: '水溶肥料',
    category: 'fertilizer',
    icon: 'i-heroicons-drop',
    description: '易溶于水的高浓度肥料，适合灌溉施肥和叶面喷施，吸收快效果好。',
    specification: '1kg/袋、5kg/袋、10kg/袋',
    features: ['速溶性好', '利用率高', '使用方便', '效果显著'],
    image: 'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    id: 4,
    name: '农用化学品',
    category: 'chemical',
    icon: 'i-heroicons-beaker',
    description: '专业的农用化学产品，严格按照国家标准生产，安全可靠。',
    specification: '按需定制',
    features: ['质量稳定', '安全环保', '效果可靠', '价格优势'],
    image: 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    id: 5,
    name: '土壤调理剂',
    category: 'chemical',
    icon: 'i-heroicons-globe-alt',
    description: '改善土壤酸碱度和结构的专用产品，提高土壤的保水保肥能力。',
    specification: '25kg/袋',
    features: ['调节pH值', '改善结构', '增强透气性', '提高肥力'],
    image: 'https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    id: 6,
    name: '复合微生物肥料',
    category: 'microbial',
    icon: 'i-heroicons-cpu-chip',
    description: '含有多种有益微生物的新型肥料，能够固氮、解磷、解钾，改善土壤微生态。',
    specification: '20kg/袋',
    features: ['含活性菌', '生态环保', '改善土质', '提高免疫力'],
    image: 'https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    id: 7,
    name: '生物菌剂',
    category: 'microbial',
    icon: 'i-heroicons-bug-ant',
    description: '高活性生物菌剂，能够抑制有害菌，促进有益菌繁殖，改善根际环境。',
    specification: '1kg/袋、5kg/袋',
    features: ['活菌含量高', '抑制病害', '促进生长', '绿色环保'],
    image: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    id: 8,
    name: '技术咨询服务',
    category: 'technical',
    icon: 'i-heroicons-chat-bubble-left-right',
    description: '提供专业的农业技术咨询服务，包括施肥方案设计、病虫害防治等。',
    specification: '按项目计费',
    features: ['专家指导', '方案定制', '跟踪服务', '效果保证'],
    image: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  },
  {
    id: 9,
    name: '技术培训',
    category: 'technical',
    icon: 'i-heroicons-academic-cap',
    description: '为客户提供专业的农业技术培训，提高种植技术水平和管理能力。',
    specification: '按培训规模计费',
    features: ['专业讲师', '实操指导', '现场教学', '终身服务'],
    image: 'https://images.unsplash.com/photo-1556075798-4825dfaaf498?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75'
  }
]

const productFeatures = [
  {
    icon: 'i-heroicons-shield-check',
    title: '品质保证',
    description: '严格的质量控制体系，确保每一批产品都符合国家标准'
  },
  {
    icon: 'i-heroicons-rocket-launch',
    title: '技术先进',
    description: '采用先进的生产工艺和技术，产品性能优异'
  },
  {
    icon: 'i-heroicons-heart',
    title: '环保安全',
    description: '绿色环保产品，对环境和人体安全无害'
  },
  {
    icon: 'i-heroicons-users',
    title: '服务专业',
    description: '专业的技术团队提供全程服务支持'
  }
]

const filteredProducts = computed(() => {
  if (selectedCategory.value === 'all') {
    return products
  }
  return products.filter(product => product.category === selectedCategory.value)
})

function getCategoryName(categoryId) {
  const category = categories.find(cat => cat.id === categoryId)
  return category ? category.name : '未分类'
}

watch(selectedProduct, (newValue) => {
  if (!newValue) {
    setTimeout(() => {
      selectedProduct.value = null
    }, 300)
  }
})
</script>
