// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: "2025-07-15",
  devtools: { enabled: true },
  components: {
    global: true,
    dirs: ["~/components"],
  },
  // 添加静态站点生成配置
  nitro: {
    preset: "static",
  },
});
