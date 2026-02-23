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
      <div class="hero__rule"></div>
      <h1 class="hero__name">ÜLKÜ ÖZCAN</h1>
      <p class="hero__title">DANIŞMAN ORTAK</p>
      <div class="hero__pipe"></div>
      <p class="hero__company">KW BORSA</p>
      <div class="hero__rule hero__rule--bottom"></div>
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
  filter: grayscale(100%);
}

.hero__overlay {
  position: absolute;
  inset: 0;
  background:
    linear-gradient(180deg,
      rgba(10, 10, 10, 0.5) 0%,
      rgba(10, 10, 10, 0.25) 40%,
      rgba(10, 10, 10, 0.35) 70%,
      rgba(10, 10, 10, 0.9) 100%
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

.hero__rule {
  width: 60px;
  height: 1px;
  background: var(--color-white);
  margin: 0 auto 2.5rem;
  opacity: 0.4;
}

.hero__rule--bottom {
  margin: 2.5rem auto 0;
}

.hero__name {
  font-family: var(--font-display);
  font-size: clamp(3rem, 8vw, 6rem);
  font-weight: 600;
  letter-spacing: 0.2em;
  color: #fff;
  margin-bottom: 0.8rem;
  line-height: 1;
  text-shadow: 0 2px 30px rgba(0, 0, 0, 0.4);
}

.hero__title {
  font-family: var(--font-body);
  font-size: clamp(0.8rem, 1.4vw, 0.95rem);
  font-weight: 300;
  letter-spacing: 0.35em;
  text-transform: uppercase;
  color: rgba(255, 255, 255, 0.8);
  margin-bottom: 0.4rem;
}

.hero__pipe {
  width: 1px;
  height: 20px;
  background: rgba(255, 255, 255, 0.3);
  margin: 0.4rem auto;
}

.hero__company {
  font-family: var(--font-body);
  font-size: clamp(0.7rem, 1.1vw, 0.8rem);
  font-weight: 400;
  letter-spacing: 0.25em;
  text-transform: uppercase;
  color: rgba(255, 255, 255, 0.5);
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
  font-size: 0.65rem;
  letter-spacing: 0.25em;
  text-transform: uppercase;
  color: rgba(255, 255, 255, 0.4);
  font-weight: 300;
}

.hero__scroll-line {
  width: 1px;
  height: 40px;
  background: linear-gradient(to bottom, rgba(255, 255, 255, 0.5), transparent);
  animation: scrollPulse 2s ease-in-out infinite;
}

@keyframes scrollPulse {
  0%, 100% { opacity: 0.3; transform: scaleY(1); }
  50% { opacity: 1; transform: scaleY(1.2); }
}

@media (max-width: 768px) {
  .hero__name {
    letter-spacing: 0.12em;
  }

  .hero__title {
    letter-spacing: 0.2em;
  }
}
</style>
