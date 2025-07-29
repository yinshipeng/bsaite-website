<template>
  <div class="pt-20">
    <!-- 页面头部 -->
    <section class="bg-gradient-to-br from-blue-700 via-blue-600 to-blue-500 text-white py-20">
      <div class="container mx-auto px-4 text-center">
        <h1 class="text-4xl md:text-5xl font-bold mb-4 text-white drop-shadow-md">解决方案</h1>
        <p class="text-xl text-blue-100">为不同行业提供专业的农业解决方案</p>
      </div>
    </section>

    <!-- 解决方案列表 -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
          <div 
            v-for="(solution, index) in solutions" 
            :key="solution.id"
            class="modern-card overflow-hidden group cursor-pointer"
            @click="selectedSolution = solution"
          >
            <div class="h-64 bg-gradient-to-br from-blue-50 to-blue-100 flex items-center justify-center relative overflow-hidden">
              <img 
                :src="solution.image" 
                :alt="solution.title" 
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
              />
              <div class="absolute top-4 right-4">
                <UBadge color="blue" variant="soft" size="xs">
                  {{ solution.category }}
                </UBadge>
              </div>
            </div>
            
            <div class="p-8">
              <h3 class="text-2xl font-bold mb-4 text-gray-800 group-hover:text-blue-600 transition-colors">
                {{ solution.title }}
              </h3>
              <p class="text-gray-600 leading-relaxed mb-6">
                {{ solution.description }}
              </p>
              
              <div class="space-y-3 mb-6">
                <h4 class="font-semibold text-gray-800">核心优势：</h4>
                <div class="flex flex-wrap gap-2">
                  <UBadge 
                    v-for="advantage in solution.advantages.slice(0, 3)" 
                    :key="advantage"
                    color="gray" 
                    variant="soft" 
                    size="xs"
                  >
                    {{ advantage }}
                  </UBadge>
                </div>
              </div>
              
              <UButton 
                color="blue" 
                variant="outline" 
                size="sm"
              >
                了解详情 →
              </UButton>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 服务流程 -->
    <section class="py-20 bg-gray-50">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16">
          <h2 class="text-3xl font-bold text-gray-800 mb-4">服务流程</h2>
          <p class="text-xl text-gray-600">专业的服务流程，确保方案效果</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          <div 
            v-for="(step, index) in serviceSteps" 
            :key="index"
            class="text-center relative"
          >
            <div class="modern-card p-6 mb-4">
              <div class="w-16 h-16 bg-blue-600 rounded-full flex items-center justify-center mx-auto mb-4">
                <span class="text-white font-bold text-xl">{{ index + 1 }}</span>
              </div>
              <h3 class="text-lg font-semibold mb-3 text-gray-800">{{ step.title }}</h3>
              <p class="text-gray-600 text-sm">{{ step.description }}</p>
            </div>
            
            <!-- 连接线 -->
            <div 
              v-if="index < serviceSteps.length - 1"
              class="hidden lg:block absolute top-1/2 -right-4 transform -translate-y-1/2"
            >
              <UIcon name="i-heroicons-arrow-right" class="w-6 h-6 text-blue-600" />
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 成功案例 -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16">
          <h2 class="text-3xl font-bold text-gray-800 mb-4">成功案例</h2>
          <p class="text-xl text-gray-600">真实案例见证我们的专业实力</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div 
            v-for="caseItem in successCases" 
            :key="caseItem.id"
            class="modern-card p-6"
          >
            <div class="flex items-center space-x-3 mb-4">
              <div class="w-12 h-12 bg-gray-100 rounded-full flex items-center justify-center">
                <UIcon :name="caseItem.icon" class="w-6 h-6 text-gray-600" />
              </div>
              <div>
                <h3 class="font-semibold text-gray-800">{{ caseItem.client }}</h3>
                <p class="text-sm text-gray-500">{{ caseItem.industry }}</p>
              </div>
            </div>
            
            <p class="text-gray-600 text-sm leading-relaxed mb-4">{{ caseItem.description }}</p>
            
            <div class="space-y-2">
              <div 
                v-for="result in caseItem.results" 
                :key="result"
                class="flex items-center text-sm"
              >
                <UIcon name="i-heroicons-check-circle" class="w-4 h-4 text-gray-600 mr-2" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 解决方案详情弹窗 -->
    <UModal v-model="showSolutionDetail" :ui="{ width: 'max-w-4xl' }">
      <UCard v-if="selectedSolution">
        <template #header>
          <div class="flex items-center justify-between">
            <div>
              <h3 class="text-2xl font-bold text-gray-800">{{ selectedSolution.title }}</h3>
              <UBadge color="blue" variant="soft" size="xs" class="mt-2">
                {{ selectedSolution.category }}
              </UBadge>
            </div>
            <UButton 
              color="gray" 
              variant="ghost" 
              size="sm"
              @click="selectedSolution = null"
            >
              <UIcon name="i-heroicons-x-mark" class="w-5 h-5" />
            </UButton>
          </div>
        </template>
        
        <div class="space-y-6">
          <!-- 方案描述 -->
          <div>
            <h4 class="font-semibold text-gray-800 mb-3">方案介绍</h4>
            <p class="text-gray-600 leading-relaxed">{{ selectedSolution.description }}</p>
          </div>
          
          <!-- 核心优势 -->
          <div>
            <h4 class="font-semibold text-gray-800 mb-3">核心优势</h4>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
              <div 
                v-for="advantage in selectedSolution.advantages" 
                :key="advantage"
                class="flex items-center"
              >
                <UIcon name="i-heroicons-check-circle" class="w-4 h-4 text-blue-600 mr-2" />
              </div>
            </div>
          </div>
          
          <!-- 适用场景 -->
          <div v-if="selectedSolution.scenarios">
            <h4 class="font-semibold text-gray-800 mb-3">适用场景</h4>
            <div class="space-y-2">
              <div 
                v-for="scenario in selectedSolution.scenarios" 
                :key="scenario"
                class="flex items-center"
              >
                <UIcon name="i-heroicons-arrow-right" class="w-4 h-4 text-blue-600 mr-2" />
                <span class="text-gray-600">{{ scenario }}</span>
              </div>
            </div>
          </div>
        </div>

        <template #footer>
          <div class="flex justify-between">
            <UButton 
              color="gray" 
              variant="outline"
              @click="selectedSolution = null"
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
  title: '解决方案',
  meta: [
    { name: 'description', content: '芭赛特进出口(商丘)有限公司为不同行业提供专业的农业解决方案' }
  ]
})

const selectedSolution = ref(null)
const showSolutionDetail = computed(() => !!selectedSolution.value)

const solutions = [
  {
    id: 1,
    title: '大田作物营养方案',
    category: '种植解决方案',
    icon: 'i-heroicons-globe-alt',
    image: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=600&h=400&fit=crop&crop=entropy&auto=format&q=75',
    description: '针对玉米、小麦、水稻等大田作物，提供全生育期的营养管理方案。通过科学配比的肥料产品，提高作物产量和品质，降低生产成本。',
    advantages: ['营养均衡', '增产明显', '成本优化', '环保安全', '技术支持', '定期跟踪'],
    scenarios: [
      '大型农场的规模化种植',
      '合作社的集约化经营',
      '家庭农场的精细化管理',
      '新型农业经营主体'
    ]
  },
  {
    id: 2,
    title: '经济作物高效方案',
    category: '种植解决方案',
    icon: 'i-heroicons-leaf',
    image: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=600&h=400&fit=crop&crop=entropy&auto=format&q=75',
    description: '专为蔬菜、水果、中药材等经济作物设计的高效营养方案。注重品质提升和产值增加，帮助种植户获得更好的经济效益。',
    advantages: ['品质提升', '产值增加', '抗性增强', '商品性好', '市场竞争力强', '收益可观'],
    scenarios: [
      '设施蔬菜种植基地',
      '果园的精品化管理',
      '中药材规范化种植',
      '特色农产品基地'
    ]
  },
  {
    id: 3,
    title: '土壤修复改良方案',
    category: '土壤管理',
    icon: 'i-heroicons-beaker',
    image: 'https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?w=600&h=400&fit=crop&crop=entropy&auto=format&q=75',
    description: '针对酸化、盐碱化、板结等问题土壤，提供系统性的修复改良方案。通过土壤调理剂和有机肥料的科学配合，恢复土壤健康。',
    advantages: ['改良效果显著', '持续时间长', '生态环保', '成本合理', '技术成熟', '案例丰富'],
    scenarios: [
      '酸化土壤的治理',
      '盐碱地的改良利用',
      '板结土壤的疏松',
      '污染土壤的修复'
    ]
  },
  {
    id: 4,
    title: '有机农业认证方案',
    category: '认证服务',
    icon: 'i-heroicons-shield-check',
    image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=600&h=400&fit=crop&crop=entropy&auto=format&q=75',
    description: '为追求有机认证的农业生产者提供全套解决方案。包括有机投入品供应、技术指导、认证申请等一站式服务。',
    advantages: ['符合有机标准', '认证通过率高', '产品附加值高', '市场前景好', '环保可持续', '品牌价值大'],
    scenarios: [
      '有机蔬菜生产基地',
      '有机水果种植园',
      '有机粮食生产区',
      '生态农业园区'
    ]
  },
  {
    id: 5,
    title: '智慧农业技术方案',
    category: '技术服务',
    icon: 'i-heroicons-cpu-chip',
    image: 'https://images.unsplash.com/photo-1574943320219-553eb213f72d?w=600&h=400&fit=crop&crop=entropy&auto=format&q=75',
    description: '结合物联网、大数据等现代信息技术，为农业生产提供智能化管理方案。实现精准施肥、智能灌溉、病虫害预警等功能。',
    advantages: ['技术先进', '效率提升', '成本节约', '管理便捷', '数据支撑', '决策科学'],
    scenarios: [
      '现代农业示范园',
      '智能温室大棚',
      '精准农业基地',
      '数字化农场'
    ]
  },
  {
    id: 6,
    title: '农业废弃物资源化方案',
    category: '环保处理',
    icon: 'i-heroicons-arrow-path',
    image: 'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=600&h=400&fit=crop&crop=entropy&auto=format&q=75',
    description: '将农业生产过程中产生的废弃物转化为有机肥料，实现资源循环利用。既解决了环境污染问题，又创造了经济价值。',
    advantages: ['变废为宝', '环保效益好', '经济效益明显', '技术成熟', '操作简便', '可持续发展'],
    scenarios: [
      '畜禽养殖场粪污处理',
      '农作物秸秆利用',
      '果蔬加工废料处理',
      '农业园区循环经济'
    ]
  }
]

const serviceSteps = [
  {
    title: '需求分析',
    description: '深入了解客户需求，分析现状和问题'
  },
  {
    title: '方案设计',
    description: '制定个性化的解决方案和实施计划'
  },
  {
    title: '产品供应',
    description: '提供优质的产品和配套的技术服务'
  },
  {
    title: '效果跟踪',
    description: '持续跟踪效果，优化调整方案'
  }
]

const successCases = [
  {
    id: 1,
    client: '绿源农业合作社',
    industry: '大田种植',
    icon: 'i-heroicons-home-modern',
    description: '合作社采用我们的大田作物营养方案后，玉米平均产量提高了18%，品质明显改善。',
    results: ['产量提高18%', '品质等级提升', '成本节约15%', '收益增加25%']
  },
  {
    id: 2,
    client: '丰收果业有限公司',
    industry: '果树种植',
    icon: 'i-heroicons-building-office',
    description: '采用我们的经济作物高效方案，果园产量和品质都有显著提升，市场竞争力增强。',
    results: ['果品品质提升', '商品率提高20%', '销售价格上涨', '品牌知名度提高']
  },
  {
    id: 3,
    client: '生态农业示范园',
    industry: '生态农业',
    icon: 'i-heroicons-building-storefront',
    description: '通过土壤修复改良方案，成功将盐碱地改造为优质农田，实现了生态效益和经济效益双赢。',
    results: ['土壤pH值恢复正常', '作物成活率95%以上', '产量达到预期目标', '生态环境明显改善']
  }
]

watch(selectedSolution, (newValue) => {
  if (!newValue) {
    setTimeout(() => {
      selectedSolution.value = null
    }, 300)
  }
})
</script>
