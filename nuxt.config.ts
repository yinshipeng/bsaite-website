export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: [
    '@nuxt/ui',
    '@nuxtjs/tailwindcss'
  ],
  css: [
    '~/assets/css/main.css'
  ],
  // 添加静态站点生成配置
  nitro: {
    preset: 'static'
  },
  app: {
    head: {
      title: '芭赛特进出口(商丘)有限公司',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'description', content: '芭赛特进出口(商丘)有限公司专业从事肥料进出口贸易，提供优质的农业解决方案' },
        { name: 'keywords', content: '芭赛特,进出口,肥料,农业,商丘,化工产品,复合微生物肥料' },
        { property: 'og:title', content: '芭赛特进出口(商丘)有限公司' },
        { property: 'og:description', content: '专业从事肥料进出口贸易，提供优质的农业解决方案' },
        { property: 'og:type', content: 'website' },
        { property: 'og:url', content: 'https://www.bsaite.cn' }
      ],
      link: [
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
        { rel: 'canonical', href: 'https://www.bsaite.cn' }
      ]
    }
  },
  runtimeConfig: {
    public: {
      siteName: '芭赛特进出口(商丘)有限公司',
      siteUrl: 'https://www.bsaite.cn',
      companyPhone: '400-0563-118',
      companyAddress: '河南省商丘市民权县绿洲街道办事处庄周大道东段北侧2-1号'
    }
  }
})
