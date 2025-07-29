<template>
  <div class="min-h-screen flex flex-col">
    <!-- 导航栏 -->
    <TheHeader />
    
    <!-- 主要内容 -->
    <main class="flex-1">
      <slot />
    </main>
    
    <!-- 页脚 -->
    <TheFooter />
  </div>
</template>

<script setup>
// 默认布局
</script>