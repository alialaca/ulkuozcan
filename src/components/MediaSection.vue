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
    { threshold: 0.1 }
  )
  if (sectionRef.value) observer.observe(sectionRef.value)
})

const links = [
  {
    label: 'YouTube',
    description: 'Video içeriklerimi izleyin',
    href: 'https://www.youtube.com/channel/UC-FRo8_MPArF0sJSR6uRdYQ',
    icon: 'youtube',
  },
  {
    label: 'Instagram',
    description: '@kwulkuozcan',
    href: 'https://www.instagram.com/kwulkuozcan/',
    icon: 'instagram',
  },
]
</script>

<template>
  <section id="medya" class="media" ref="sectionRef">
    <div class="media__container" :class="{ 'media__container--visible': visible }">
      <div class="media__header">
        <span class="media__label">Medya</span>
        <h2 class="media__heading">İÇERİKLER</h2>
        <div class="media__heading-rule"></div>
      </div>

      <div class="media__links">
        <a
          v-for="link in links"
          :key="link.label"
          :href="link.href"
          target="_blank"
          rel="noopener noreferrer"
          class="media__link"
        >
          <div class="media__link-icon">
            <!-- YouTube -->
            <svg v-if="link.icon === 'youtube'" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M2.5 17a24.12 24.12 0 0 1 0-10 2 2 0 0 1 1.4-1.4 49.56 49.56 0 0 1 16.2 0A2 2 0 0 1 21.5 7a24.12 24.12 0 0 1 0 10 2 2 0 0 1-1.4 1.4 49.55 49.55 0 0 1-16.2 0A2 2 0 0 1 2.5 17" />
              <path d="m10 15 5-3-5-3z" />
            </svg>
            <!-- Instagram -->
            <svg v-if="link.icon === 'instagram'" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <rect x="2" y="2" width="20" height="20" rx="5" ry="5" />
              <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z" />
              <line x1="17.5" y1="6.5" x2="17.51" y2="6.5" />
            </svg>
          </div>

          <div class="media__link-body">
            <span class="media__link-label">{{ link.label }}</span>
            <span class="media__link-desc">{{ link.description }}</span>
          </div>

          <svg class="media__link-arrow" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="5" y1="12" x2="19" y2="12" />
            <polyline points="12 5 19 12 12 19" />
          </svg>
        </a>
      </div>
    </div>
  </section>
</template>

<style scoped>
.media {
  padding: var(--section-padding) 1.5rem;
  background: var(--color-bg);
  position: relative;
}

.media::before {
  content: '';
  position: absolute;
  top: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 1px;
  height: 60px;
  background: linear-gradient(to bottom, var(--color-divider-strong), transparent);
}

.media__container {
  max-width: 600px;
  margin: 0 auto;
  opacity: 0;
  transform: translateY(40px);
  transition: opacity 1s cubic-bezier(0.25, 0.46, 0.45, 0.94),
              transform 1s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.media__container--visible {
  opacity: 1;
  transform: translateY(0);
}

.media__header {
  text-align: center;
  margin-bottom: 3rem;
}

.media__label {
  font-family: var(--font-body);
  font-size: 0.7rem;
  font-weight: 400;
  letter-spacing: 0.3em;
  text-transform: uppercase;
  color: var(--color-text-muted);
  display: block;
  margin-bottom: 1rem;
}

.media__heading {
  font-family: var(--font-display);
  font-size: clamp(2rem, 4.5vw, 3.2rem);
  font-weight: 600;
  color: var(--color-white);
  letter-spacing: 0.08em;
}

.media__heading-rule {
  width: 60px;
  height: 1px;
  background: var(--color-divider-strong);
  margin: 1.5rem auto 0;
}

.media__links {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.media__link {
  display: flex;
  align-items: center;
  gap: 1.5rem;
  padding: 1.5rem 2rem;
  background: var(--color-bg-card);
  border: 1px solid rgba(255, 255, 255, 0.06);
  border-radius: 2px;
  text-decoration: none;
  color: inherit;
  transition: border-color 0.3s ease, background-color 0.3s ease;
}

.media__link:hover {
  border-color: var(--color-divider-strong);
  background: rgba(255, 255, 255, 0.03);
}

.media__link-icon {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background: var(--color-accent-dim);
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--color-white);
  flex-shrink: 0;
}

.media__link-body {
  display: flex;
  flex-direction: column;
  gap: 0.2rem;
  flex: 1;
}

.media__link-label {
  font-family: var(--font-display);
  font-size: 1.1rem;
  font-weight: 600;
  color: var(--color-white);
  letter-spacing: 0.05em;
  text-transform: uppercase;
}

.media__link-desc {
  font-family: var(--font-body);
  font-size: 0.8rem;
  color: var(--color-text-muted);
  font-weight: 300;
}

.media__link-arrow {
  color: var(--color-text-muted);
  flex-shrink: 0;
  transition: color 0.3s ease, transform 0.3s ease;
}

.media__link:hover .media__link-arrow {
  color: var(--color-white);
  transform: translateX(4px);
}

@media (max-width: 768px) {
  .media__link {
    padding: 1.25rem 1.5rem;
    gap: 1rem;
  }

  .media__link-icon {
    width: 42px;
    height: 42px;
  }
}
</style>
