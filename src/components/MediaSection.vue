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

// Placeholder YouTube video IDs — replace with actual videos from the channel
const videos = [
  { id: 'VIDEO_ID_1', title: 'Video 1' },
  { id: 'VIDEO_ID_2', title: 'Video 2' },
  { id: 'VIDEO_ID_3', title: 'Video 3' },
]

const youtubeChannel = 'https://www.youtube.com/channel/UC-FRo8_MPArF0sJSR6uRdYQ'
const instagramUrl = 'https://www.instagram.com/kwulkuozcan/'
</script>

<template>
  <section id="medya" class="media" ref="sectionRef">
    <div class="media__container" :class="{ 'media__container--visible': visible }">
      <div class="media__header">
        <span class="media__label">Medya</span>
        <h2 class="media__heading">İçerikler</h2>
        <div class="media__heading-line"></div>
      </div>

      <!-- YouTube -->
      <div class="media__youtube">
        <div class="media__sub-header">
          <svg class="media__icon" width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
            <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814z"/>
            <path d="M9.545 15.568V8.432L15.818 12l-6.273 3.568z" fill="#0f0f0f"/>
          </svg>
          <h3>YouTube</h3>
        </div>

        <div class="media__video-grid">
          <div v-for="video in videos" :key="video.id" class="media__video-item">
            <div class="media__video-wrap">
              <iframe
                :src="`https://www.youtube.com/embed/${video.id}`"
                :title="video.title"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen
                loading="lazy"
              ></iframe>
            </div>
          </div>
        </div>

        <a :href="youtubeChannel" target="_blank" rel="noopener noreferrer" class="media__channel-link">
          Tüm videolar için YouTube kanalını ziyaret edin
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="7" y1="17" x2="17" y2="7" />
            <polyline points="7 7 17 7 17 17" />
          </svg>
        </a>
      </div>

      <!-- Instagram -->
      <div class="media__instagram">
        <div class="media__sub-header">
          <svg class="media__icon" width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.052.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98C8.333 23.986 8.741 24 12 24c3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 1 0 0 12.324 6.162 6.162 0 0 0 0-12.324zM12 16a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm6.406-11.845a1.44 1.44 0 1 0 0 2.881 1.44 1.44 0 0 0 0-2.881z"/>
          </svg>
          <h3>Instagram</h3>
        </div>

        <a :href="instagramUrl" target="_blank" rel="noopener noreferrer" class="media__insta-card">
          <div class="media__insta-avatar">
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round">
              <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
              <circle cx="12" cy="7" r="4" />
            </svg>
          </div>
          <div class="media__insta-info">
            <span class="media__insta-handle">@kwulkuozcan</span>
            <span class="media__insta-desc">Instagram profilini ziyaret et</span>
          </div>
          <svg class="media__insta-arrow" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="7" y1="17" x2="17" y2="7" />
            <polyline points="7 7 17 7 17 17" />
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
  background: linear-gradient(to bottom, var(--color-gold), transparent);
  opacity: 0.4;
}

.media__container {
  max-width: var(--content-width);
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
  margin-bottom: 4rem;
}

.media__label {
  font-family: var(--font-body);
  font-size: 0.7rem;
  font-weight: 400;
  letter-spacing: 0.3em;
  text-transform: uppercase;
  color: var(--color-gold);
  display: block;
  margin-bottom: 1rem;
}

.media__heading {
  font-family: var(--font-display);
  font-size: clamp(2rem, 4vw, 3rem);
  font-weight: 300;
  color: var(--color-text);
  letter-spacing: 0.05em;
}

.media__heading-line {
  width: 50px;
  height: 1px;
  background: var(--color-gold);
  margin: 1.5rem auto 0;
  opacity: 0.5;
}

.media__sub-header {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  margin-bottom: 2rem;
}

.media__icon {
  color: var(--color-gold);
}

.media__sub-header h3 {
  font-family: var(--font-display);
  font-size: 1.5rem;
  font-weight: 400;
  color: var(--color-text);
  letter-spacing: 0.03em;
}

.media__youtube {
  margin-bottom: 4rem;
}

.media__video-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1.5rem;
  margin-bottom: 1.5rem;
}

.media__video-wrap {
  position: relative;
  padding-bottom: 56.25%;
  height: 0;
  overflow: hidden;
  border-radius: 4px;
  background: var(--color-bg-card);
  border: 1px solid rgba(255, 255, 255, 0.05);
}

.media__video-wrap iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.media__channel-link {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.85rem;
  font-weight: 400;
  letter-spacing: 0.02em;
  color: var(--color-gold);
  transition: color 0.3s ease;
}

.media__channel-link:hover {
  color: var(--color-gold-light);
}

.media__insta-card {
  display: flex;
  align-items: center;
  gap: 1.25rem;
  padding: 1.5rem 2rem;
  background: var(--color-bg-card);
  border: 1px solid var(--color-divider);
  border-radius: 6px;
  transition: border-color 0.3s ease, background-color 0.3s ease;
  text-decoration: none;
  max-width: 400px;
}

.media__insta-card:hover {
  border-color: var(--color-gold);
  background: rgba(184, 150, 90, 0.05);
}

.media__insta-avatar {
  width: 56px;
  height: 56px;
  border-radius: 50%;
  background: var(--color-bg-warm);
  border: 1px solid var(--color-divider);
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--color-text-muted);
  flex-shrink: 0;
}

.media__insta-info {
  display: flex;
  flex-direction: column;
  gap: 0.2rem;
  flex: 1;
}

.media__insta-handle {
  font-family: var(--font-body);
  font-size: 0.95rem;
  font-weight: 500;
  color: var(--color-text);
}

.media__insta-desc {
  font-size: 0.8rem;
  color: var(--color-text-muted);
}

.media__insta-arrow {
  color: var(--color-gold);
  flex-shrink: 0;
}

@media (max-width: 768px) {
  .media__video-grid {
    grid-template-columns: 1fr;
    gap: 1rem;
  }

  .media__insta-card {
    max-width: 100%;
    padding: 1.25rem 1.5rem;
  }
}
</style>
