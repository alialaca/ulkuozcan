<script setup>
import { ref, onMounted } from 'vue'

const loaded = ref(false)
const videoSrc = '/banner.mp4'

onMounted(() => {
  setTimeout(() => {
    loaded.value = true
  }, 300)
})
</script>

<template>
  <header class="hero">
    <div class="hero__video-wrap">
      <video
        class="hero__video"
        autoplay
        loop
        muted
        playsinline
        preload="auto"
        poster=""
      >
        <source :src="videoSrc" type="video/mp4" />
      </video>
      <div class="hero__overlay"></div>
    </div>

    <div class="hero__content" :class="{ 'hero__content--visible': loaded }">
      <div class="hero__gold-line"></div>
      <h1 class="hero__name">ÜLKÜ ÖZCAN</h1>
      <div class="hero__divider"></div>
      <p class="hero__title">Danışman Ortak</p>
      <p class="hero__company">KW BORSA</p>
      <div class="hero__gold-line hero__gold-line--bottom"></div>
    </div>

    <div class="hero__scroll" :class="{ 'hero__scroll--visible': loaded }">
      <span class="hero__scroll-text">Keşfet</span>
      <div class="hero__scroll-line"></div>
    </div>
  </header>
</template>

<style scoped>
.hero {
  position: relative;
  width: 100%;
  height: 100vh;
  min-height: 600px;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.hero__video-wrap {
  position: absolute;
  inset: 0;
  z-index: 0;
}

.hero__video {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.hero__overlay {
  position: absolute;
  inset: 0;
  background:
    linear-gradient(180deg,
      rgba(15, 15, 15, 0.4) 0%,
      rgba(15, 15, 15, 0.2) 40%,
      rgba(15, 15, 15, 0.3) 70%,
      rgba(15, 15, 15, 0.85) 100%
    );
  z-index: 1;
}

.hero__content {
  position: relative;
  z-index: 2;
  text-align: center;
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 1.2s cubic-bezier(0.25, 0.46, 0.45, 0.94),
              transform 1.2s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.hero__content--visible {
  opacity: 1;
  transform: translateY(0);
}

.hero__gold-line {
  width: 50px;
  height: 1px;
  background: var(--color-gold);
  margin: 0 auto 2rem;
  opacity: 0.7;
}

.hero__gold-line--bottom {
  margin: 2rem auto 0;
}

.hero__name {
  font-family: var(--font-display);
  font-size: clamp(2.5rem, 6vw, 4.5rem);
  font-weight: 300;
  letter-spacing: 0.35em;
  color: #fff;
  margin-bottom: 1rem;
  text-shadow: 0 2px 20px rgba(0, 0, 0, 0.3);
}

.hero__divider {
  width: 1px;
  height: 30px;
  background: var(--color-gold);
  margin: 0 auto 1rem;
  opacity: 0.6;
}

.hero__title {
  font-family: var(--font-body);
  font-size: clamp(0.85rem, 1.5vw, 1rem);
  font-weight: 300;
  letter-spacing: 0.3em;
  text-transform: uppercase;
  color: var(--color-gold-light);
  margin-bottom: 0.3rem;
}

.hero__company {
  font-family: var(--font-body);
  font-size: clamp(0.75rem, 1.2vw, 0.85rem);
  font-weight: 400;
  letter-spacing: 0.25em;
  text-transform: uppercase;
  color: var(--color-text-muted);
}

.hero__scroll {
  position: absolute;
  bottom: 2.5rem;
  left: 50%;
  transform: translateX(-50%);
  z-index: 2;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.6rem;
  opacity: 0;
  transition: opacity 1.5s ease 1s;
}

.hero__scroll--visible {
  opacity: 1;
}

.hero__scroll-text {
  font-family: var(--font-body);
  font-size: 0.7rem;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: var(--color-text-muted);
}

.hero__scroll-line {
  width: 1px;
  height: 40px;
  background: linear-gradient(to bottom, var(--color-gold), transparent);
  animation: scrollPulse 2s ease-in-out infinite;
}

@keyframes scrollPulse {
  0%, 100% { opacity: 0.3; transform: scaleY(1); }
  50% { opacity: 1; transform: scaleY(1.2); }
}

@media (max-width: 768px) {
  .hero__name {
    letter-spacing: 0.2em;
  }

  .hero__title {
    letter-spacing: 0.15em;
  }
}
</style>
