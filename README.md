# 芭赛特进出口(商丘)有限公司官网

基于 Nuxt.js 4 构建的现代化企业官网，采用响应式设计，提供优质的用户体验。

## 🚀 项目特色

- ✨ **现代化设计**: 采用简洁大气的设计风格，符合现代企业形象
- 📱 **响应式布局**: 完美适配桌面端、平板和手机端设备
- ⚡ **高性能**: 基于 Nuxt.js 4 框架，支持 SSR/SSG，加载速度更快
- 🎨 **UI 组件库**: 使用 @nuxt/ui 3.0 提供丰富的交互组件
- 🔍 **SEO 优化**: 内置 SEO 优化配置，提高搜索引擎排名
- 🌐 **多页面**: 包含首页、关于我们、产品中心、新闻资讯、联系我们等完整页面
- 🔧 **TypeScript**: 完整的 TypeScript 支持，提供更好的开发体验

## 🛠️ 技术栈

- **框架**: [Nuxt.js 4](https://nuxt.com/) - Vue.js 的全栈框架，最新版本
- **UI 库**: [@nuxt/ui 3.0](https://ui.nuxt.com/) - 基于 Tailwind CSS 的现代组件库
- **样式**: [Tailwind CSS](https://tailwindcss.com/) - 原子化 CSS 框架
- **图标**: [Heroicons](https://heroicons.com/) - 精美的 SVG 图标库
- **类型检查**: TypeScript - 类型安全的 JavaScript
- **表单验证**: Zod - 类型安全的模式验证库

## 🆕 Nuxt 4 新特性

使用 Nuxt 4 带来的优势：

- **更快的构建速度**: 优化的构建系统和更好的缓存策略
- **改进的开发体验**: 更快的热重载和更好的错误提示
- **增强的类型安全**: 更强的 TypeScript 集成
- **优化的包体积**: 更小的生产构建包
- **实验性功能**: 支持最新的 Vue.js 和生态系统特性

## 📁 项目结构

```
bsaite-website/
├── assets/           # 静态资源
│   └── css/         # 样式文件
├── components/       # Vue 组件
│   ├── TheHeader.vue # 顶部导航
│   └── TheFooter.vue # 底部页脚
├── layouts/         # 布局模板
│   └── default.vue  # 默认布局
├── pages/           # 页面文件
│   ├── index.vue    # 首页
│   ├── about.vue    # 关于我们
│   ├── products.vue # 产品中心
│   ├── news.vue     # 新闻资讯
│   └── contact.vue  # 联系我们
├── public/          # 公共静态文件
├── app.vue          # 根组件
├── nuxt.config.ts   # Nuxt 配置文件
└── package.json     # 项目依赖
```

## 🚀 快速开始

### 环境要求

- Node.js >= 18.x (推荐使用 LTS 版本)
- npm 或 yarn 或 pnpm (推荐使用 pnpm)

### 安装依赖

```bash
# 使用 pnpm (推荐)
pnpm install

# 使用 npm
npm install

# 使用 yarn
yarn install
```

### 开发模式

```bash
# 启动开发服务器
pnpm dev
# 或
npm run dev

# 访问 http://localhost:3000
```

### 构建部署

```bash
# 构建生产版本
pnpm build

# 预览生产版本
pnpm preview

# 生成静态站点
pnmp generate
```

## 📄 页面介绍

### 首页 (/)

- Hero 区域展示企业形象
- 服务优势介绍
- 产品展示预览
- 公司简介
- 新闻资讯预览
- CTA 行动引导

### 关于我们 (/about)

- 公司详细介绍
- 企业愿景使命
- 发展历程时间线
- 团队优势展示

### 产品中心 (/products)

- 产品分类筛选
- 产品列表展示
- 产品详情弹窗
- 产品特点介绍

### 新闻资讯 (/news)

- 新闻分类筛选
- 新闻列表展示
- 新闻详情查看

### 联系我们 (/contact)

- 联系方式展示
- 在线咨询表单

## 🎨 设计系统

### 色彩主题

- 主色调: `#2C5530` (深绿色)
- 辅助色: `#4A7C59` (浅绿色)
- 强调色: `#22c55e` (亮绿色)
- 背景色: `#F8F9FA` (浅灰色)

### 字体规范

- 主字体: Inter, system-ui, -apple-system, sans-serif
- 字重: 400 (Regular), 600 (SemiBold), 700 (Bold)

### 组件规范

- 圆角: 8px (小), 12px (中), 16px (大)
- 阴影: 多层级阴影系统
- 间距: 基于 4px 网格系统

## 🔧 配置管理

### 运行时配置

项目使用 Nuxt 4 的 `runtimeConfig` 来管理配置：

```typescript
// nuxt.config.ts
export default defineNuxtConfig({
  runtimeConfig: {
    public: {
      siteName: "芭赛特进出口(商丘)有限公司",
      siteUrl: "https://www.bsaite.cn",
      companyPhone: "400-0563-118",
      companyAddress: "河南省商丘市民权县绿洲街道办事处庄周大道东段北侧2-1号",
    },
  },
});
```

在组件中使用：

```vue
<script setup>
const config = useRuntimeConfig();
// 访问配置：config.public.siteName
</script>
```

### 修改公司信息

在 `nuxt.config.ts` 中修改 `runtimeConfig.public` 配置即可全局更新公司信息。

### 修改主题色彩

编辑 `tailwind.config.js` 文件中的颜色配置：

```javascript
theme: {
  extend: {
    colors: {
      primary: {
        // 自定义主色调色板
      },
      green: {
        // 自定义绿色色板
      }
    }
  }
}
```

## 📱 响应式设计

网站采用移动优先的响应式设计策略：

- 移动端: < 768px
- 平板端: 768px - 1024px
- 桌面端: > 1024px

所有组件和页面都经过精心设计，确保在不同设备上都有良好的显示效果。

## 🔍 SEO 优化

- 页面标题和描述优化
- Open Graph 标签支持
- 结构化数据标记
- 语义化 HTML 标签
- 图片 alt 属性
- Canonical URLs
- 内部链接优化
- 页面加载速度优化

## ⚡ 性能优化

- **代码分割**: 自动路由级别的代码分割
- **预渲染**: 支持静态站点生成 (SSG)
- **图片优化**: 自动图片优化和懒加载
- **缓存策略**: 智能缓存和更新策略
- **Bundle 分析**: 内置 bundle 分析工具

## 🧪 实验性功能

Nuxt 4 启用了一些实验性功能来提供更好的性能：

```typescript
experimental: {
  sharedPrerenderData: false,
  compileTemplate: true,
  resetAsyncDataToUndefined: true,
  templateUtils: true,
  relativeWatchPaths: true
}
```

## 🤝 贡献指南

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 创建 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 📞 联系方式

如有任何问题或建议，欢迎联系：

- 公司官网: www.bsaite.cn
- 联系电话: 400-0563-118
- 邮箱地址: contact@bsaite.cn

---

© 2025 芭赛特进出口(商丘)有限公司. 保留所有权利.
