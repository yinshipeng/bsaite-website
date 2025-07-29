<template>
  <div class="pt-20">
    <!-- 页面头部 -->
    <section
      class="bg-gradient-to-br from-blue-700 via-blue-600 to-blue-500 text-white py-20"
    >
      <div class="container mx-auto px-4 text-center">
        <h1
          class="text-4xl md:text-5xl font-bold mb-4 text-white drop-shadow-md"
        >
          新闻资讯
        </h1>
        <p class="text-xl text-blue-100">关注行业动态，了解最新资讯</p>
      </div>
    </section>

    <!-- 新闻分类 -->
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

    <!-- 新闻列表 -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <article
            v-for="article in filteredNews"
            :key="article.id"
            class="modern-card overflow-hidden group cursor-pointer"
            @click="selectedArticle = article"
          >
            <div
              class="h-48 bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center overflow-hidden"
            >
              <img 
                :src="article.image" 
                :alt="article.title" 
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
              />
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <UBadge
                  :color="getCategoryColor(article.category)"
                  variant="soft"
                  size="xs"
                >
                  {{ getCategoryName(article.category) }}
                </UBadge>
                <span class="text-xs text-gray-500">{{
                  formatDate(article.date)
                }}</span>
              </div>
              <h3
                class="text-lg font-semibold mb-3 text-gray-800 group-hover:text-blue-600 transition-colors"
              >
                {{ article.title }}
              </h3>
              <p class="text-gray-600 text-sm leading-relaxed mb-4">
                {{ article.summary }}
              </p>
              <div class="flex items-center justify-between">
                <span class="text-xs text-gray-500"
                  >阅读时间: {{ article.readTime }}分钟</span
                >
                <UButton color="blue" variant="ghost" size="xs">
                  阅读更多 →
                </UButton>
              </div>
            </div>
          </article>
        </div>

        <!-- 没有新闻时的提示 -->
        <div v-if="filteredNews.length === 0" class="text-center py-20">
          <UIcon
            name="i-heroicons-newspaper"
            class="w-16 h-16 text-gray-400 mx-auto mb-4"
          />
          <p class="text-gray-500 text-lg">该分类下暂无新闻</p>
        </div>
      </div>
    </section>

    <!-- 新闻详情弹窗 -->
    <UModal v-model="showArticleDetail" :ui="{ width: 'max-w-4xl' }">
      <UCard v-if="selectedArticle">
        <template #header>
          <div class="flex items-start justify-between">
            <div class="flex-1 pr-4">
              <div class="flex items-center space-x-2 mb-2">
                <UBadge
                  :color="getCategoryColor(selectedArticle.category)"
                  variant="soft"
                  size="xs"
                >
                  {{ getCategoryName(selectedArticle.category) }}
                </UBadge>
                <span class="text-sm text-gray-500">{{
                  formatDate(selectedArticle.date)
                }}</span>
              </div>
              <h3 class="text-xl font-bold text-gray-800 leading-tight">
                {{ selectedArticle.title }}
              </h3>
            </div>
            <UButton
              color="gray"
              variant="ghost"
              size="sm"
              @click="selectedArticle = null"
            >
              <UIcon name="i-heroicons-x-mark" class="w-5 h-5" />
            </UButton>
          </div>
        </template>

        <div class="prose max-w-none">
          <div class="text-gray-600 leading-relaxed whitespace-pre-line">
            {{ selectedArticle.content }}
          </div>
        </div>

        <template #footer>
          <div class="flex justify-between items-center">
            <div class="text-sm text-gray-500">
              阅读时间: {{ selectedArticle.readTime }}分钟
            </div>
            <UButton
              color="gray"
              variant="ghost"
              @click="selectedArticle = null"
            >
              关闭
            </UButton>
          </div>
        </template>
      </UCard>
    </UModal>
  </div>
</template>

<script setup>
useHead({
  title: "新闻资讯",
  meta: [
    {
      name: "description",
      content: "芭赛特进出口(商丘)有限公司新闻资讯，了解行业动态和公司最新消息",
    },
  ],
});

const selectedCategory = ref("all");
const selectedArticle = ref(null);
const currentPage = ref(1);
const pageSize = 9;
const showArticleDetail = computed(() => !!selectedArticle.value);

const categories = [
  { id: "all", name: "全部新闻" },
  { id: "company", name: "公司新闻" },
  { id: "industry", name: "行业动态" },
  { id: "technology", name: "技术资讯" },
  { id: "policy", name: "政策法规" },
];

const newsArticles = [
  {
    id: 1,
    title: "芭赛特公司正式成立，开启农业进出口新篇章",
    category: "company",
    date: "2025-03-19",
    summary:
      "芭赛特进出口(商丘)有限公司于2025年3月19日正式成立，注册资本100万元，标志着公司在农业进出口贸易领域的正式起航。",
    readTime: 3,
    image: "https://images.unsplash.com/photo-1556075798-4825dfaaf498?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75",
    content: `芭赛特进出口(商丘)有限公司于2025年3月19日正式成立，这标志着我们在农业进出口贸易领域的正式起航。

公司注册资本100万元，位于河南省商丘市民权县绿洲街道办事处庄周大道东段北侧2-1号，法定代表人为王卫兵先生。公司经营范围涵盖货物进出口、技术进出口、肥料销售、化肥销售、化工产品生产与销售等多个领域。

作为一家专业的农业进出口贸易企业，我们致力于为客户提供优质的农业产品和服务。公司将秉承"诚信经营、客户至上、创新发展、合作共赢"的核心价值观，为现代农业发展贡献力量。

未来，我们将继续加强技术研发，扩大产品线，为广大客户提供更加优质的产品和服务。`,
  },
  {
    id: 2,
    title: "现代农业发展趋势：绿色化、智能化成为主流",
    category: "industry",
    date: "2025-01-15",
    summary:
      "随着科技的不断进步和环保意识的增强，现代农业正朝着绿色化、智能化方向发展，这为农业企业带来了新的机遇和挑战。",
    readTime: 5,
    image: "https://images.unsplash.com/photo-1574943320219-553eb213f72d?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75",
    content: `现代农业发展正经历着深刻的变革，绿色化和智能化成为两大发展趋势。

绿色化发展方面，越来越多的农业企业开始重视环境保护，采用环保的生产工艺和产品配方。有机肥料、生物肥料等绿色产品需求量不断增长，传统化肥企业也在加快转型升级。

智能化发展方面，物联网、大数据、人工智能等技术在农业领域的应用日益广泛。精准农业、智能灌溉、无人机植保等技术的推广，大大提高了农业生产效率。

这些发展趋势为农业企业带来了新的机遇。企业需要加强技术创新，开发符合市场需求的绿色、智能产品，才能在激烈的市场竞争中立于不败之地。

芭赛特公司将紧跟行业发展趋势，加大在绿色产品和智能技术方面的投入，为客户提供更加优质的产品和服务。`,
  },
  {
    id: 3,
    title: "复合微生物肥料技术取得新突破",
    category: "technology",
    date: "2025-01-10",
    summary:
      "最新研究表明，复合微生物肥料在提高作物产量和改善土壤质量方面具有显著效果，该技术的应用前景十分广阔。",
    readTime: 4,
    image: "https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75",
    content: `复合微生物肥料作为新型生物肥料，在农业生产中发挥着越来越重要的作用。

研究表明，复合微生物肥料含有多种有益微生物，能够固氮、解磷、解钾，有效提高土壤肥力。同时，这些有益微生物还能抑制土壤中的有害菌，改善作物根际环境，提高作物的抗病能力。

实验数据显示，使用复合微生物肥料的作物产量平均提高15-25%，土壤有机质含量显著增加，土壤结构得到明显改善。

芭赛特公司积极投入复合微生物肥料的研发工作，我们的产品采用先进的菌种筛选和培养技术，确保产品中有益菌的活性和数量。

未来，我们将继续加大研发投入，不断完善产品配方，为客户提供更加高效的微生物肥料产品。`,
  },
  {
    id: 4,
    title: "国家发布农业绿色发展新政策",
    category: "policy",
    date: "2025-01-05",
    summary:
      "国家近期发布了一系列支持农业绿色发展的政策措施，为农业企业转型升级提供了政策支持和发展机遇。",
    readTime: 4,
    image: "https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75",
    content: `为推动农业绿色发展，国家近期发布了一系列重要政策措施。

政策要求，到2025年，农业绿色发展要取得显著成效，农业投入品减量化、生产清洁化、废弃物资源化、产业模式生态化水平明显提升。

具体措施包括：
1. 加大对绿色农业技术研发的支持力度
2. 推广有机肥料、生物肥料等绿色投入品
3. 建立农业绿色发展评价体系
4. 完善绿色农产品标准和认证制度

这些政策措施为农业企业特别是肥料企业的发展指明了方向。企业需要积极响应国家政策，加快绿色产品的研发和推广。

芭赛特公司将严格按照国家政策要求，加大绿色产品的开发力度，为农业绿色发展贡献力量。`,
  },
  {
    id: 5,
    title: "肥料行业市场分析：需求呈现多元化趋势",
    category: "industry",
    date: "2024-12-28",
    summary:
      "2024年肥料行业面临新的机遇和挑战，市场需求呈现多元化趋势，高效、环保型肥料产品备受青睐。",
    readTime: 6,
    image: "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75",
    content: `2024年肥料行业发展呈现出新的特点和趋势。

市场需求方面，传统化肥需求增长放缓，而有机肥料、生物肥料、缓释肥料等高效环保型产品需求快速增长。这反映了农业生产者对产品质量和环保性能要求的提高。

技术发展方面，肥料企业加大了在新产品开发和生产工艺改进方面的投入。微生物肥料、纳米肥料等新型产品不断涌现，为行业发展注入了新的活力。

竞争格局方面，行业集中度进一步提高，具有技术优势和品牌影响力的企业市场份额不断扩大。

政策环境方面，国家对农业绿色发展的支持力度不断加大，为肥料行业转型升级提供了良好的政策环境。

面对这些变化，芭赛特公司将抓住机遇，加快新产品开发，提高产品质量，为客户提供更加优质的产品和服务。`,
  },
  {
    id: 6,
    title: "土壤改良技术应用效果显著",
    category: "technology",
    date: "2024-12-20",
    summary:
      "通过应用先进的土壤改良技术，多个试验点的土壤质量得到显著改善，为作物高产优质提供了有力保障。",
    readTime: 5,
    image: "https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=400&h=300&fit=crop&crop=entropy&auto=format&q=75",
    content: `土壤改良技术在农业生产中发挥着重要作用，通过科学的土壤管理可以有效提高土壤肥力。

试验结果显示，通过使用土壤调理剂和有机肥料，试验田的土壤有机质含量提高了20-30%，土壤pH值得到有效调节，土壤团粒结构明显改善。

具体改良措施包括：
1. 定期检测土壤理化性质
2. 合理施用有机肥料和土壤调理剂
3. 采用轮作和间作等农艺措施
4. 控制化肥使用量，提高利用效率

改良后的土壤不仅提高了作物产量，还改善了农产品品质。同时，土壤的保水保肥能力增强，有利于农业可持续发展。

芭赛特公司将继续推广土壤改良技术，为客户提供全方位的土壤管理解决方案。`,
  },
];

const filteredNews = computed(() => {
  let filtered =
    selectedCategory.value === "all"
      ? newsArticles
      : newsArticles.filter(
          (article) => article.category === selectedCategory.value
        );

  // 分页处理
  const start = (currentPage.value - 1) * pageSize;
  const end = start + pageSize;
  return filtered.slice(start, end);
});

const pageCount = computed(() => {
  const filtered =
    selectedCategory.value === "all"
      ? newsArticles
      : newsArticles.filter(
          (article) => article.category === selectedCategory.value
        );
  return Math.ceil(filtered.length / pageSize);
});

function getCategoryName(categoryId) {
  const category = categories.find((cat) => cat.id === categoryId);
  return category ? category.name : "未分类";
}

function getCategoryColor(categoryId) {
  const colors = {
    company: "blue",
    industry: "gray",
    technology: "gray",
    policy: "gray",
  };
  return colors[categoryId] || "gray";
}

function formatDate(dateString) {
  const date = new Date(dateString);
  return date.toLocaleDateString("zh-CN", {
    year: "numeric",
    month: "long",
    day: "numeric",
  });
}

watch(selectedCategory, () => {
  currentPage.value = 1;
});

watch(selectedArticle, (newValue) => {
  if (!newValue) {
    setTimeout(() => {
      selectedArticle.value = null;
    }, 300);
  }
});
</script>
