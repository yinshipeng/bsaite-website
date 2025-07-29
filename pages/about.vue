<template>
  <div class="pt-20">
    <!-- 页面头部 -->
    <section class="bg-gradient-to-br from-blue-700 via-blue-600 to-blue-500 text-white py-20">
      <div class="container mx-auto px-4 text-center">
        <h1 class="text-4xl md:text-5xl font-bold mb-4 text-white drop-shadow-md">关于我们</h1>
        <p class="text-xl text-blue-100">了解芭赛特的发展历程与企业文化</p>
      </div>
    </section>

    <!-- 公司简介 -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          <div class="space-y-6">
            <h2 class="text-3xl font-bold text-gray-800">芭赛特进出口(商丘)有限公司</h2>
            <div class="space-y-4 text-gray-600 leading-relaxed">
              <p>
                芭赛特进出口（商丘）有限公司成立于2025年3月19日，法定代表人为王卫兵，
                注册资本为100万元，统一社会信用代码为91411421MAEF5J2U3T。
              </p>
              <p>
                企业注册地址位于河南省商丘市民权县绿洲街道办事处庄周大道东段北侧2-1号，
                所属行业为批发业。公司经营范围广泛，包含货物进出口、技术进出口、
                肥料销售、化肥销售等多个领域。
              </p>
              <p>
                我们专注于化工产品生产与销售（不含许可类化工产品）、土壤与肥料的复混加工、
                技术服务、技术开发、技术咨询、技术交流、技术转让、技术推广等业务，
                并积极开展进出口代理和复合微生物肥料研发等工作。
              </p>
              <p>
                公司还致力于海洋生物活性物质提取、纯化、合成技术研发，
                为现代农业发展提供创新的解决方案。
              </p>
            </div>
          </div>

          <div class="relative">
            <div class="w-full h-96 bg-gradient-to-br from-blue-50 to-gray-100 rounded-2xl overflow-hidden">
              <img 
                src="https://images.unsplash.com/photo-1497366216548-37526070297c?w=600&h=400&fit=crop&crop=entropy&auto=format&q=75" 
                alt="现代企业办公环境" 
                class="w-full h-full object-cover"
              />
            </div>
            <div class="absolute -top-4 -left-4 w-24 h-24 bg-gray-600 rounded-full flex items-center justify-center">
              <UIcon name="i-heroicons-star" class="w-12 h-12 text-white" />
            </div>
            <div class="absolute -bottom-4 -right-4 w-24 h-24 bg-blue-600 rounded-full flex items-center justify-center">
              <UIcon name="i-heroicons-check" class="w-12 h-12 text-white" />
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 企业愿景 -->
    <section class="py-20 bg-gray-50">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16">
          <h2 class="text-3xl font-bold text-gray-800 mb-4">企业愿景</h2>
          <p class="text-xl text-gray-600">致力于成为农业领域的优秀服务商</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div class="modern-card p-8 text-center">
            <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-6">
              <UIcon name="i-heroicons-eye" class="w-8 h-8 text-blue-600" />
            </div>
            <h3 class="text-xl font-semibold mb-4 text-gray-800">企业愿景</h3>
            <p class="text-gray-600 leading-relaxed">
              成为国内领先的农业进出口贸易企业，为现代农业发展贡献力量
            </p>
          </div>

          <div class="modern-card p-8 text-center">
            <div class="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-6">
              <UIcon name="i-heroicons-flag" class="w-8 h-8 text-gray-600" />
            </div>
            <h3 class="text-xl font-semibold mb-4 text-gray-800">企业使命</h3>
            <p class="text-gray-600 leading-relaxed">
              通过提供优质的农业产品和服务，助力农业现代化发展
            </p>
          </div>

          <div class="modern-card p-8 text-center">
            <div class="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-6">
              <UIcon name="i-heroicons-heart" class="w-8 h-8 text-gray-600" />
            </div>
            <h3 class="text-xl font-semibold mb-4 text-gray-800">核心价值观</h3>
            <p class="text-gray-600 leading-relaxed">
              诚信经营、客户至上、创新发展、合作共赢
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- 发展历程 -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16">
          <h2 class="text-3xl font-bold text-gray-800 mb-4">发展历程</h2>
          <p class="text-xl text-gray-600">见证芭赛特的成长足迹</p>
        </div>

        <div class="relative">
          <div class="absolute left-1/2 transform -translate-x-1/2 w-1 h-full bg-blue-600"></div>
          
          <div class="space-y-12">
            <div 
              v-for="(milestone, index) in milestones" 
              :key="index"
              class="flex items-center"
              :class="index % 2 === 0 ? 'flex-row' : 'flex-row-reverse'"
            >
              <div class="flex-1" :class="index % 2 === 0 ? 'pr-8' : 'pl-8'">
                <div class="modern-card p-6" :class="index % 2 === 0 ? 'text-right' : 'text-left'">
                  <div class="text-lg font-semibold text-blue-600 mb-2">{{ milestone.date }}</div>
                  <h3 class="text-xl font-bold text-gray-800 mb-3">{{ milestone.title }}</h3>
                  <p class="text-gray-600">{{ milestone.description }}</p>
                </div>
              </div>
              
              <div class="w-4 h-4 bg-blue-600 rounded-full relative z-10"></div>
              
              <div class="flex-1"></div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 团队介绍 -->
    <section class="py-20 bg-gray-50">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16">
          <h2 class="text-3xl font-bold text-gray-800 mb-4">团队优势</h2>
          <p class="text-xl text-gray-600">专业的团队，优质的服务</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          <div 
            v-for="(advantage, index) in teamAdvantages" 
            :key="index"
            class="modern-card p-6 text-center"
          >
            <div class="w-16 h-16 bg-gradient-to-br from-blue-600 to-blue-700 rounded-full flex items-center justify-center mx-auto mb-4">
              <UIcon :name="advantage.icon" class="w-8 h-8 text-white" />
            </div>
            <h3 class="text-lg font-semibold mb-2 text-gray-800">{{ advantage.title }}</h3>
            <p class="text-gray-600">{{ advantage.description }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- 联系我们 CTA -->
    <section class="py-20 bg-gradient-to-br from-blue-700 via-blue-600 to-blue-500 text-white">
      <div class="container mx-auto px-4 text-center">
        <h2 class="text-3xl font-bold mb-6 text-white drop-shadow-md">加入我们，共创美好未来</h2>
        <p class="text-xl mb-8 text-blue-100 max-w-3xl mx-auto">
          如果您对我们的企业文化和发展理念认同，欢迎与我们合作
        </p>
        <UButton 
          color="white" 
          variant="solid" 
          size="lg"
          :ui="{ rounded: 'rounded-full' }"
          to="/contact"
        >
          <UIcon name="i-heroicons-phone" class="w-5 h-5 mr-2" />
          联系我们
        </UButton>
      </div>
    </section>
  </div>
</template>

<script setup>
useHead({
  title: '关于我们',
  meta: [
    { name: 'description', content: '了解芭赛特进出口(商丘)有限公司的发展历程、企业文化和团队优势' }
  ]
})

const milestones = [
  {
    date: '2025年3月',
    title: '公司成立',
    description: '芭赛特进出口(商丘)有限公司正式成立，注册资本100万元'
  },
  {
    date: '2025年4月',
    title: '业务拓展',
    description: '开始开展肥料销售和化工产品生产销售业务'
  },
  {
    date: '2025年5月',
    title: '技术研发',
    description: '启动复合微生物肥料研发项目，加强技术创新'
  },
  {
    date: '2025年6月',
    title: '国际合作',
    description: '开展货物进出口业务，拓展国际市场'
  }
]

const teamAdvantages = [
  {
    icon: 'i-heroicons-academic-cap',
    title: '专业团队',
    description: '拥有丰富经验的专业技术团队'
  },
  {
    icon: 'i-heroicons-light-bulb',
    title: '技术创新',
    description: '持续的技术研发和创新能力'
  },
  {
    icon: 'i-heroicons-shield-check',
    title: '质量保证',
    description: '严格的质量控制和检测体系'
  },
  {
    icon: 'i-heroicons-users',
    title: '客户服务',
    description: '专业的客户服务和技术支持'
  }
]
</script>
