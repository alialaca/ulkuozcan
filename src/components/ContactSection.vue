<script setup>
import { ref, onMounted } from 'vue'

const sectionRef = ref(null)
const visible = ref(false)

onMounted(() => {
  const observer = new IntersectionObserver(
    ([entry]) => {
      if (entry.isIntersecting) {
        visible.value = true
        observer.disconnect()
      }
    },
    { threshold: 0.15 }
  )
  if (sectionRef.value) observer.observe(sectionRef.value)
})

const contactItems = [
  {
    label: 'E-posta',
    value: 'ulkuozcan@kww.com.tr',
    href: 'mailto:ulkuozcan@kww.com.tr',
    icon: 'mail',
  },
  {
    label: 'Telefon',
    value: '0 542 468 37 99',
    href: 'tel:+905424683799',
    icon: 'phone',
  },
  {
    label: 'Instagram',
    value: '@kwulkuozcan',
    href: 'https://www.instagram.com/kwulkuozcan/',
    icon: 'instagram',
    external: true,
  },
  {
    label: 'YouTube',
    value: 'Ülkü Özcan',
    href: 'https://www.youtube.com/channel/UC-FRo8_MPArF0sJSR6uRdYQ',
    icon: 'youtube',
    external: true,
  },
  {
    label: 'Adres',
    value: 'Adres bilgisi yakında eklenecektir',
    href: null,
    icon: 'map',
  },
]
</script>

<template>
  <section id="iletisim" class="contact" ref="sectionRef">
    <div class="contact__container" :class="{ 'contact__container--visible': visible }">
      <div class="contact__header">
        <span class="contact__label">İletişim</span>
        <h2 class="contact__heading">İletişime Geçin</h2>
        <div class="contact__heading-line"></div>
      </div>

      <div class="contact__grid">
        <template v-for="item in contactItems" :key="item.label">
          <component
            :is="item.href ? 'a' : 'div'"
            :href="item.href || undefined"
            :target="item.external ? '_blank' : undefined"
            :rel="item.external ? 'noopener noreferrer' : undefined"
            class="contact__card"
            :class="{ 'contact__card--link': item.href }"
          >
            <div class="contact__card-icon">
              <!-- Mail -->
              <svg v-if="item.icon === 'mail'" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                <rect x="2" y="4" width="20" height="16" rx="2" />
                <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" />
              </svg>
              <!-- Phone -->
              <svg v-if="item.icon === 'phone'" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z" />
              </svg>
              <!-- Instagram -->
              <svg v-if="item.icon === 'instagram'" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                <rect x="2" y="2" width="20" height="20" rx="5" ry="5" />
                <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z" />
                <line x1="17.5" y1="6.5" x2="17.51" y2="6.5" />
              </svg>
              <!-- YouTube -->
              <svg v-if="item.icon === 'youtube'" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M2.5 17a24.12 24.12 0 0 1 0-10 2 2 0 0 1 1.4-1.4 49.56 49.56 0 0 1 16.2 0A2 2 0 0 1 21.5 7a24.12 24.12 0 0 1 0 10 2 2 0 0 1-1.4 1.4 49.55 49.55 0 0 1-16.2 0A2 2 0 0 1 2.5 17" />
                <path d="m10 15 5-3-5-3z" />
              </svg>
              <!-- Map -->
              <svg v-if="item.icon === 'map'" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z" />
                <circle cx="12" cy="10" r="3" />
              </svg>
            </div>
            <div class="contact__card-body">
              <span class="contact__card-label">{{ item.label }}</span>
              <span class="contact__card-value">{{ item.value }}</span>
            </div>
            <svg v-if="item.href" class="contact__card-arrow" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <line x1="7" y1="17" x2="17" y2="7" />
              <polyline points="7 7 17 7 17 17" />
            </svg>
          </component>
        </template>
      </div>
    </div>
  </section>
</template>

<style scoped>
.contact {
  padding: var(--section-padding) 1.5rem;
  background: var(--color-bg-warm);
  position: relative;
}

.contact::before {
  content: '';
  position: absolute;
  top: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 1px;
  height: 60px;
  background: linear-gradient(to bottom, var(--color-gold), transparent);
  opacity: 0.4;
}

.contact__container {
  max-width: 700px;
  margin: 0 auto;
  opacity: 0;
  transform: translateY(40px);
  transition: opacity 1s cubic-bezier(0.25, 0.46, 0.45, 0.94),
              transform 1s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.contact__container--visible {
  opacity: 1;
  transform: translateY(0);
}

.contact__header {
  text-align: center;
  margin-bottom: 3.5rem;
}

.contact__label {
  font-family: var(--font-body);
  font-size: 0.7rem;
  font-weight: 400;
  letter-spacing: 0.3em;
  text-transform: uppercase;
  color: var(--color-gold);
  display: block;
  margin-bottom: 1rem;
}

.contact__heading {
  font-family: var(--font-display);
  font-size: clamp(2rem, 4vw, 3rem);
  font-weight: 300;
  color: var(--color-text);
  letter-spacing: 0.05em;
}

.contact__heading-line {
  width: 50px;
  height: 1px;
  background: var(--color-gold);
  margin: 1.5rem auto 0;
  opacity: 0.5;
}

.contact__grid {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.contact__card {
  display: flex;
  align-items: center;
  gap: 1.25rem;
  padding: 1.25rem 1.5rem;
  background: var(--color-bg-card);
  border: 1px solid rgba(255, 255, 255, 0.04);
  border-radius: 6px;
  transition: border-color 0.3s ease, background-color 0.3s ease;
  text-decoration: none;
  color: inherit;
}

.contact__card--link:hover {
  border-color: var(--color-divider);
  background: rgba(184, 150, 90, 0.04);
}

.contact__card-icon {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  background: var(--color-gold-dim);
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--color-gold);
  flex-shrink: 0;
}

.contact__card-body {
  display: flex;
  flex-direction: column;
  gap: 0.15rem;
  flex: 1;
  min-width: 0;
}

.contact__card-label {
  font-size: 0.7rem;
  font-weight: 400;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: var(--color-text-muted);
}

.contact__card-value {
  font-size: 0.95rem;
  color: var(--color-text);
  font-weight: 300;
}

.contact__card-arrow {
  color: var(--color-gold);
  opacity: 0.5;
  flex-shrink: 0;
  transition: opacity 0.3s ease;
}

.contact__card--link:hover .contact__card-arrow {
  opacity: 1;
}

@media (max-width: 768px) {
  .contact__card {
    padding: 1rem 1.25rem;
    gap: 1rem;
  }

  .contact__card-icon {
    width: 40px;
    height: 40px;
  }
}
</style>
