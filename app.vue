<template>
  <div class="min-h-screen bg-white">
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
  </div>
</template>

<script setup>
// 全局页面配置
useHead({
  titleTemplate: '%s - 芭赛特进出口(商丘)有限公司',
  meta: [
    { name: 'description', content: '芭赛特进出口(商丘)有限公司专业从事肥料进出口贸易，提供优质的农业解决方案' },
    { name: 'keywords', content: '芭赛特,进出口,肥料,农业,商丘,化工产品' }
  ]
})
</script>