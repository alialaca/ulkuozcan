<script setup>
import HeroSection from './components/HeroSection.vue'
import AboutSection from './components/AboutSection.vue'
import MediaSection from './components/MediaSection.vue'
import ContactSection from './components/ContactSection.vue'
</script>

<template>
  <div class="app">
    <HeroSection />
    <main>
      <AboutSection />
      <MediaSection />
      <ContactSection />
    </main>
    <footer class="site-footer">
      <div class="footer-line"></div>
      <p>&copy; {{ new Date().getFullYear() }} Ülkü Özcan. Tüm hakları saklıdır.</p>
    </footer>
  </div>
</template>

<style>
*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

:root {
  --color-bg: #0f0f0f;
  --color-bg-warm: #1c1917;
  --color-bg-card: #1a1814;
  --color-gold: #b8965a;
  --color-gold-light: #d4b896;
  --color-gold-dim: rgba(184, 150, 90, 0.15);
  --color-text: #e8e0d8;
  --color-text-muted: #9c8f82;
  --color-divider: rgba(184, 150, 90, 0.25);

  --font-display: 'Cormorant', Georgia, serif;
  --font-body: 'Figtree', -apple-system, sans-serif;

  --section-padding: clamp(4rem, 10vw, 8rem);
  --content-width: 1100px;
}

html {
  scroll-behavior: smooth;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  font-family: var(--font-body);
  font-weight: 300;
  color: var(--color-text);
  background-color: var(--color-bg);
  line-height: 1.7;
  font-size: 16px;
  overflow-x: hidden;
}

a {
  color: var(--color-gold);
  text-decoration: none;
  transition: color 0.3s ease;
}

a:hover {
  color: var(--color-gold-light);
}

img {
  max-width: 100%;
  display: block;
}

/* Reveal animation */
.reveal {
  opacity: 0;
  transform: translateY(30px);
  transition: opacity 0.8s cubic-bezier(0.25, 0.46, 0.45, 0.94),
              transform 0.8s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.reveal.visible {
  opacity: 1;
  transform: translateY(0);
}
</style>

<style scoped>
.site-footer {
  padding: 2rem 1.5rem 3rem;
  text-align: center;
}

.footer-line {
  width: 40px;
  height: 1px;
  background: var(--color-gold);
  margin: 0 auto 1.5rem;
  opacity: 0.5;
}

.site-footer p {
  font-family: var(--font-body);
  font-size: 0.8rem;
  color: var(--color-text-muted);
  letter-spacing: 0.05em;
}
</style>
