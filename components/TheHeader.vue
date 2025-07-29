<template>
  <header class="bg-white navbar-shadow fixed w-full top-0 z-50">
    <div class="container mx-auto px-4">
      <nav class="flex items-center justify-between h-20">
        <!-- Logo -->
        <NuxtLink to="/" class="flex items-center space-x-3">
          <div class="w-12 h-12 bg-blue-600 rounded-lg flex items-center justify-center">
            <span class="text-white font-bold text-xl">芭</span>
          </div>
          <div class="flex flex-col">
            <span class="text-xl font-bold text-gray-800">{{ config.public.siteName.split('(')[0] }}</span>
            <span class="text-sm text-gray-600">BSAITE</span>
          </div>
        </NuxtLink>

        <!-- 桌面端导航菜单 -->
        <div class="hidden lg:flex items-center space-x-8">
          <NuxtLink 
            v-for="item in menuItems" 
            :key="item.name"
            :to="item.path"
            class="text-gray-700 hover:text-blue-600 font-medium transition-colors duration-300 relative group"
            active-class="text-blue-600"
          >
            {{ item.name }}
            <span class="absolute -bottom-1 left-0 w-0 h-0.5 bg-blue-600 transition-all duration-300 group-hover:w-full"></span>
          </NuxtLink>
        </div>

        <!-- 联系按钮 -->
        <div class="hidden lg:flex items-center space-x-4">
          <UButton 
            color="blue" 
            variant="outline" 
            size="sm"
            @click="showContact = true"
          >
            联系我们
          </UButton>
          <UButton 
            color="white" 
            size="sm"
            :ui="{ rounded: 'rounded-full' }"
          >
            <UIcon name="i-heroicons-phone" class="w-4 h-4" />
            {{ config.public.companyPhone }}
          </UButton>
        </div>

        <!-- 移动端菜单按钮 -->
        <UButton 
          class="lg:hidden"
          color="gray" 
          variant="ghost" 
          size="sm"
          @click="mobileMenuOpen = !mobileMenuOpen"
        >
          <UIcon name="i-heroicons-bars-3" class="w-6 h-6" />
        </UButton>
      </nav>

      <!-- 移动端菜单 -->
      <div 
        v-show="mobileMenuOpen"
        class="lg:hidden bg-white border-t border-gray-200 py-4"
      >
        <div class="flex flex-col space-y-3">
          <NuxtLink 
            v-for="item in menuItems" 
            :key="item.name"
            :to="item.path"
            class="text-gray-700 hover:text-blue-600 font-medium py-2 transition-colors duration-300"
            active-class="text-blue-600"
            @click="mobileMenuOpen = false"
          >
            {{ item.name }}
          </NuxtLink>
          <div class="pt-3 border-t border-gray-200">
            <UButton 
              color="blue" 
              variant="solid" 
              size="sm" 
              block
              @click="showContact = true; mobileMenuOpen = false"
            >
              联系我们
            </UButton>
          </div>
        </div>
      </div>
    </div>

    <!-- 联系我们弹窗 -->
    <UModal v-model="showContact">
      <UCard>
        <template #header>
          <h3 class="text-lg font-semibold">联系我们</h3>
        </template>
        
        <div class="space-y-4">
          <div class="flex items-center space-x-3">
            <UIcon name="i-heroicons-building-office" class="w-5 h-5 text-blue-600" />
            <div>
              <p class="font-medium">{{ config.public.siteName }}</p>
              <p class="text-sm text-gray-600">{{ config.public.companyAddress }}</p>
            </div>
          </div>
          
          <div class="flex items-center space-x-3">
            <UIcon name="i-heroicons-phone" class="w-5 h-5 text-blue-600" />
            <div>
              <p class="font-medium">{{ config.public.companyPhone }}</p>
              <p class="text-sm text-gray-600">客服热线</p>
            </div>
          </div>
          
          <div class="flex items-center space-x-3">
            <UIcon name="i-heroicons-globe-alt" class="w-5 h-5 text-blue-600" />
            <div>
              <p class="font-medium">{{ config.public.siteUrl.replace('https://', '') }}</p>
              <p class="text-sm text-gray-600">官方网站</p>
            </div>
          </div>
        </div>

        <template #footer>
          <div class="flex justify-end">
            <UButton color="gray" variant="ghost" @click="showContact = false">
              关闭
            </UButton>
          </div>
        </template>
      </UCard>
    </UModal>
  </header>
</template>

<script setup>
const config = useRuntimeConfig()
const mobileMenuOpen = ref(false)
const showContact = ref(false)

const menuItems = [
  { name: '首页', path: '/' },
  { name: '关于我们', path: '/about' },
  { name: '产品中心', path: '/products' },
  { name: '新闻资讯', path: '/news' },
  { name: '解决方案', path: '/solutions' },
  { name: '联系我们', path: '/contact' }
]
</script>