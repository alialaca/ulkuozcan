<script setup>
import NavBar from './components/NavBar.vue'
import HeroSection from './components/HeroSection.vue'
import AboutSection from './components/AboutSection.vue'
import MediaSection from './components/MediaSection.vue'
import ContactSection from './components/ContactSection.vue'
</script>

<template>
  <div class="app">
    <NavBar />
    <HeroSection />
    <main>
      <AboutSection />
      <MediaSection />
      <ContactSection />
    </main>
    <footer class="site-footer">
      <div class="footer-inner">
        <p>&copy; {{ new Date().getFullYear() }} Ülkü Özcan</p>
        <span class="footer-pipe">|</span>
        <a href="https://www.sifiryirmiiki.com/" target="_blank" rel="noopener noreferrer" class="footer-agency">
          <img src="/022-logo.svg" alt="sıfır yirmi iki" class="footer-agency-logo" />
        </a>
      </div>
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
  --color-bg: #0a0a0a;
  --color-bg-alt: #111111;
  --color-bg-card: #141414;
  --color-white: #ffffff;
  --color-text: #e5e5e5;
  --color-text-muted: #777777;
  --color-accent: #ffffff;
  --color-accent-dim: rgba(255, 255, 255, 0.08);
  --color-divider: rgba(255, 255, 255, 0.15);
  --color-divider-strong: rgba(255, 255, 255, 0.3);

  --font-display: 'Barlow Condensed', Impact, sans-serif;
  --font-body: 'Poppins', -apple-system, sans-serif;

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
  color: var(--color-white);
  text-decoration: none;
  transition: opacity 0.3s ease;
}

a:hover {
  opacity: 0.7;
}

img {
  max-width: 100%;
  display: block;
}

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
  padding: 1rem 1.5rem;
  border-top: 1px solid rgba(255, 255, 255, 0.06);
}

.footer-inner {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.6rem;
}

.site-footer p {
  font-family: var(--font-body);
  font-size: 0.8rem;
  color: var(--color-text-muted);
  letter-spacing: 0.04em;
  font-weight: 300;
}

.footer-pipe {
  color: rgba(255, 255, 255, 0.15);
  font-size: 0.85rem;
  font-weight: 200;
  user-select: none;
}

.footer-agency {
  display: flex;
  align-items: center;
  opacity: 0.4;
  transition: opacity 0.3s ease;
}

.footer-agency:hover {
  opacity: 0.7;
}

.footer-agency-logo {
  height: 20px;
  width: auto;
}
</style>
