
      import { defaultExtractor as createDefaultExtractor } from "tailwindcss/lib/lib/defaultExtractor.js";
      import { customSafelistExtractor, generateSafelist } from "/Users/yinshipeng/workspace/bsaite-website/node_modules/.pnpm/@nuxt+ui@2.22.1_jwt-decode@4.0.0_magicast@0.3.5_vite@7.0.6_@types+node@22.16.5_jiti@2.5_a12f4f87f5affd725fb2d713acd9169c/node_modules/@nuxt/ui/dist/runtime/utils/colors";
      import formsPlugin from "@tailwindcss/forms";
      import aspectRatio from "@tailwindcss/aspect-ratio";
      import typography from "@tailwindcss/typography";
      import containerQueries from "@tailwindcss/container-queries";
      import headlessUi from "@headlessui/tailwindcss";

      const defaultExtractor = createDefaultExtractor({ tailwindConfig: { separator: ':' } });

      export default {
        plugins: [
          formsPlugin({ strategy: 'class' }),
          aspectRatio,
          typography,
          containerQueries,
          headlessUi
        ],
        content: {
          files: [
            "/Users/yinshipeng/workspace/bsaite-website/node_modules/.pnpm/@nuxt+ui@2.22.1_jwt-decode@4.0.0_magicast@0.3.5_vite@7.0.6_@types+node@22.16.5_jiti@2.5_a12f4f87f5affd725fb2d713acd9169c/node_modules/@nuxt/ui/dist/runtime/components/**/*.{vue,mjs,ts}",
            "/Users/yinshipeng/workspace/bsaite-website/node_modules/.pnpm/@nuxt+ui@2.22.1_jwt-decode@4.0.0_magicast@0.3.5_vite@7.0.6_@types+node@22.16.5_jiti@2.5_a12f4f87f5affd725fb2d713acd9169c/node_modules/@nuxt/ui/dist/runtime/ui.config/**/*.{mjs,js,ts}"
          ],
          transform: {
            vue: (content) => {
              return content.replaceAll(/(?:\r\n|\r|\n)/g, ' ')
            }
          },
          extract: {
            vue: (content) => {
              return [
                ...defaultExtractor(content),
                ...customSafelistExtractor("U", content, ["red","orange","amber","yellow","lime","green","emerald","teal","cyan","sky","blue","indigo","violet","purple","fuchsia","pink","rose","primary"], ["primary"])
              ]
            }
          }
        },
        safelist: generateSafelist(["primary"], ["red","orange","amber","yellow","lime","green","emerald","teal","cyan","sky","blue","indigo","violet","purple","fuchsia","pink","rose","primary"]),
      }
    