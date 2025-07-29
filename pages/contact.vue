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
          联系我们
        </h1>
        <p class="text-xl text-blue-100">随时为您提供专业的服务和支持</p>
      </div>
    </section>

    <!-- 联系信息 -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
          <!-- 联系方式 -->
          <div class="space-y-8">
            <div>
              <h2 class="text-3xl font-bold text-gray-800 mb-6">联系方式</h2>
              <p class="text-gray-600 leading-relaxed mb-8">
                我们随时准备为您提供专业的服务和支持。请通过以下方式与我们联系，
                我们将尽快回复您的咨询。
              </p>
            </div>

            <div class="space-y-6">
              <div
                v-for="contact in contactInfo"
                :key="contact.type"
                class="flex items-start space-x-4 p-6 modern-card"
              >
                <div
                  class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center flex-shrink-0"
                >
                  <UIcon :name="contact.icon" class="w-6 h-6 text-blue-600" />
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-800 mb-2">
                    {{ contact.type }}
                  </h3>
                  <p class="text-gray-600">{{ contact.value }}</p>
                  <p
                    v-if="contact.description"
                    class="text-gray-500 text-sm mt-1"
                  >
                    {{ contact.description }}
                  </p>
                </div>
              </div>
            </div>

            <!-- 工作时间 -->
            <div class="modern-card p-6">
              <h3 class="text-lg font-semibold text-gray-800 mb-4">工作时间</h3>
              <div class="space-y-2">
                <div class="flex justify-between items-center">
                  <span class="text-gray-600">周一至周五</span>
                  <span class="text-gray-800 font-medium">09:00 - 18:00</span>
                </div>
                <div class="flex justify-between items-center">
                  <span class="text-gray-600">周六</span>
                  <span class="text-gray-800 font-medium">09:00 - 17:00</span>
                </div>
                <div class="flex justify-between items-center">
                  <span class="text-gray-600">周日</span>
                  <span class="text-gray-800 font-medium">休息</span>
                </div>
              </div>
            </div>
          </div>

          <!-- 联系表单 -->
          <div class="modern-card p-8">
            <h2 class="text-2xl font-bold text-gray-800 mb-6">在线咨询</h2>
            <UForm
              :schema="schema"
              :state="formData"
              @submit="submitForm"
              class="space-y-6"
            >
              <UFormGroup label="姓名" name="name" required>
                <UInput
                  v-model="formData.name"
                  placeholder="请输入您的姓名"
                  class="modern-input"
                />
              </UFormGroup>

              <UFormGroup label="联系电话" name="phone" required>
                <UInput
                  v-model="formData.phone"
                  placeholder="请输入您的联系电话"
                  class="modern-input"
                />
              </UFormGroup>

              <UFormGroup label="邮箱地址" name="email">
                <UInput
                  v-model="formData.email"
                  type="email"
                  placeholder="请输入您的邮箱地址"
                  class="modern-input"
                />
              </UFormGroup>

              <UFormGroup label="咨询类型" name="type" required>
                <USelectMenu
                  v-model="formData.type"
                  :options="consultationTypes"
                  placeholder="请选择咨询类型"
                />
              </UFormGroup>

              <UFormGroup label="留言内容" name="message" required>
                <UTextarea
                  v-model="formData.message"
                  placeholder="请详细描述您的需求或问题"
                  :rows="5"
                  class="modern-input"
                />
              </UFormGroup>

              <UButton
                type="submit"
                color="blue"
                variant="solid"
                size="lg"
                block
                :loading="submitting"
              >
                <UIcon name="i-heroicons-paper-airplane" class="w-5 h-5 mr-2" />
                提交咨询
              </UButton>
            </UForm>
          </div>
        </div>
      </div>
    </section>

    <!-- 成功提示弹窗 -->
    <UNotifications />
  </div>
</template>

<script setup>
import { z } from "zod";

useHead({
  title: "联系我们",
  meta: [
    {
      name: "description",
      content: "联系芭赛特进出口(商丘)有限公司，获取专业的农业产品和服务咨询",
    },
  ],
});

const toast = useToast();

const contactInfo = [
  {
    type: "公司地址",
    icon: "i-heroicons-map-pin",
    value: "河南省商丘市民权县绿洲街道办事处庄周大道东段北侧2-1号",
    description: "欢迎实地考察",
  },
  {
    type: "联系电话",
    icon: "i-heroicons-phone",
    value: "400-0563-118",
    description: "客服热线，工作时间内接听",
  },
  {
    type: "官方网站",
    icon: "i-heroicons-globe-alt",
    value: "www.bsaite.cn",
    description: "了解更多产品信息",
  },
  {
    type: "法定代表人",
    icon: "i-heroicons-user",
    value: "王卫兵",
    description: "公司法定代表人",
  },
];

const consultationTypes = [
  { label: "产品咨询", value: "product" },
  { label: "价格咨询", value: "price" },
  { label: "技术支持", value: "technical" },
  { label: "合作洽谈", value: "cooperation" },
  { label: "售后服务", value: "service" },
  { label: "其他咨询", value: "other" },
];

const schema = z.object({
  name: z.string().min(1, "请输入姓名"),
  phone: z.string().min(1, "请输入联系电话"),
  email: z.string().email("请输入有效的邮箱地址").optional().or(z.literal("")),
  type: z.string().min(1, "请选择咨询类型"),
  message: z.string().min(1, "请输入留言内容"),
});

const formData = reactive({
  name: "",
  phone: "",
  email: "",
  type: "",
  message: "",
});

const submitting = ref(false);

const faqItems = [
  {
    label: "你们公司主要经营什么产品？",
    content:
      "我们主要经营肥料销售、化肥销售、化工产品生产与销售、复合微生物肥料研发等业务，同时提供技术服务、技术开发、技术咨询等专业服务。",
  },
  {
    label: "如何保证产品质量？",
    content:
      "我们建立了严格的质量控制体系，所有产品均按照国家标准生产，并通过多道质量检测程序，确保产品的安全性、有效性和稳定性。",
  },
  {
    label: "是否提供技术支持服务？",
    content:
      "是的，我们拥有专业的技术团队，可以为客户提供技术咨询、技术培训、解决方案设计等全方位的技术支持服务。",
  },
  {
    label: "产品配送范围是什么？",
    content:
      "我们的产品配送覆盖全国各地，并且可以根据客户需求提供灵活的配送方案。对于大批量订单，我们还可以提供专门的物流服务。",
  },
  {
    label: "如何成为你们的合作伙伴？",
    content:
      "欢迎有实力的企业和个人与我们合作。您可以通过电话或在线咨询的方式联系我们，我们将根据您的情况制定合适的合作方案。",
  },
];

async function submitForm() {
  try {
    submitting.value = true;
    // 模拟提交过程
    await new Promise((resolve) => setTimeout(resolve, 2000));

    toast.add({
      title: "提交成功",
      description: "我们已收到您的咨询，将尽快与您联系。",
      color: "blue",
    });

    // 重置表单
    Object.keys(formData).forEach((key) => {
      formData[key] = "";
    });
  } catch (error) {
    toast.add({
      title: "提交失败",
      description: "提交过程中出现错误，请稍后重试。",
      color: "red",
    });
  } finally {
    submitting.value = false;
  }
}
</script>
