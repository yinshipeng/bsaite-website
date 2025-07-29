<template>
  <footer class="bg-gray-600 text-white">
    <div class="container mx-auto px-4 py-12">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
        <!-- 公司信息 -->
        <div class="space-y-4">
          <div class="flex items-center space-x-3">
            <div class="w-10 h-10 bg-white bg-opacity-20 rounded-lg flex items-center justify-center">
              <span class="text-white font-bold">芭</span>
            </div>
            <div>
              <h3 class="text-xl font-bold">芭赛特</h3>
              <p class="text-sm text-blue-100">BSAITE</p>
            </div>
          </div>
          <p class="text-sm text-blue-100 leading-relaxed">
            {{ config.public.siteName }}专业从事农业进出口贸易，
            致力于为客户提供优质的肥料产品和农业解决方案。
          </p>
        </div>

        <!-- 快速链接 -->
        <div class="space-y-4">
          <h4 class="text-lg font-semibold">快速链接</h4>
          <div class="space-y-2">
            <NuxtLink 
              v-for="item in quickLinks" 
              :key="item.name"
              :to="item.path"
              class="block text-sm text-blue-100 hover:text-white transition-colors duration-300"
            >
              {{ item.name }}
            </NuxtLink>
          </div>
        </div>

        <!-- 产品分类 -->
        <div class="space-y-4">
          <h4 class="text-lg font-semibold">产品分类</h4>
          <div class="space-y-2">
            <div 
              v-for="category in productCategories" 
              :key="category"
              class="text-sm text-blue-100"
            >
              {{ category }}
            </div>
          </div>
        </div>

        <!-- 联系信息 -->
        <div class="space-y-4">
          <h4 class="text-lg font-semibold">联系我们</h4>
          <div class="space-y-3">
            <div class="flex items-start space-x-3">
              <UIcon name="i-heroicons-map-pin" class="w-5 h-5 mt-0.5 text-blue-200" />
              <p class="text-sm text-blue-100">
                {{ config.public.companyAddress }}
              </p>
            </div>
            
            <div class="flex items-center space-x-3">
              <UIcon name="i-heroicons-phone" class="w-5 h-5 text-blue-200" />
              <p class="text-sm text-blue-100">{{ config.public.companyPhone }}</p>
            </div>
            
            <div class="flex items-center space-x-3">
              <UIcon name="i-heroicons-globe-alt" class="w-5 h-5 text-blue-200" />
              <p class="text-sm text-blue-100">{{ config.public.siteUrl.replace('https://', '') }}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- 底部版权信息 -->
      <div class="border-t border-white border-opacity-20 mt-8 pt-8">
        <div class="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
          <p class="text-sm text-blue-100">
            © {{ currentYear }} {{ config.public.siteName }}. 保留所有权利.
          </p>
          <div class="flex space-x-6 text-sm text-blue-100">
            <span>统一社会信用代码：91411421MAEF5J2U3T</span>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<script setup>
const config = useRuntimeConfig()
const currentYear = new Date().getFullYear()

const quickLinks = [
  { name: '关于我们', path: '/about' },
  { name: '产品中心', path: '/products' },
  { name: '新闻资讯', path: '/news' },
  { name: '联系我们', path: '/contact' }
]

const productCategories = [
  '肥料销售',
  '化肥销售', 
  '化工产品',
  '复合微生物肥料',
  '土壤与肥料复混加工'
]
</script>