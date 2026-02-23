<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const scrolled = ref(false)
const mobileOpen = ref(false)
const activeSection = ref('')

const navLinks = [
  { label: 'Hakkında', href: '#hakkinda' },
  { label: 'İçerikler', href: '#medya' },
  { label: 'İletişim', href: '#iletisim' },
]

const sectionIds = ['iletisim', 'medya', 'hakkinda']
let observer = null

function onScroll() {
  scrolled.value = window.scrollY > 80
}

function closeMobile() {
  mobileOpen.value = false
}

function handleLinkClick() {
  closeMobile()
}

function scrollToTop() {
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

onMounted(() => {
  window.addEventListener('scroll', onScroll, { passive: true })
  onScroll()

  observer = new IntersectionObserver(
    (entries) => {
      for (const entry of entries) {
        if (entry.isIntersecting) {
          activeSection.value = entry.target.id
        }
      }
    },
    { rootMargin: '-40% 0px -55% 0px' }
  )

  sectionIds.forEach((id) => {
    const el = document.getElementById(id)
    if (el) observer.observe(el)
  })
})

onUnmounted(() => {
  window.removeEventListener('scroll', onScroll)
  if (observer) observer.disconnect()
})
</script>

<template>
  <nav class="nav" :class="{ 'nav--scrolled': scrolled }">
    <div class="nav__inner">
      <a href="#" class="nav__logo" @click.prevent="scrollToTop">
        <span class="nav__logo-first">ÜLKÜ</span>
        <span class="nav__logo-last">ÖZCAN</span>
      </a>

      <ul class="nav__links">
        <li v-for="link in navLinks" :key="link.href">
          <a
            :href="link.href"
            class="nav__link"
            :class="{ 'nav__link--active': activeSection === link.href.slice(1) }"
          >
            {{ link.label }}
          </a>
        </li>
      </ul>

      <button
        class="nav__burger"
        :class="{ 'nav__burger--open': mobileOpen }"
        @click="mobileOpen = !mobileOpen"
        aria-label="Menü"
      >
        <span></span>
        <span></span>
      </button>
    </div>

    <Transition name="overlay">
      <div v-if="mobileOpen" class="nav__overlay" @click.self="closeMobile">
        <ul class="nav__mobile-links">
          <li v-for="(link, i) in navLinks" :key="link.href" :style="{ transitionDelay: `${0.08 * i}s` }">
            <a
              :href="link.href"
              class="nav__mobile-link"
              :class="{ 'nav__mobile-link--active': activeSection === link.href.slice(1) }"
              @click="handleLinkClick"
            >
              {{ link.label }}
            </a>
          </li>
        </ul>
      </div>
    </Transition>
  </nav>
</template>

<style scoped>
.nav {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  background: transparent;
  border-bottom: 1px solid transparent;
  transition: background 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94),
              border-color 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.nav--scrolled {
  border-bottom-color: var(--color-divider);
}

.nav--scrolled::before {
  content: '';
  position: absolute;
  inset: 0;
  background: rgba(10, 10, 10, 0.92);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  z-index: -1;
}

.nav__inner {
  max-width: var(--content-width);
  margin: 0 auto;
  padding: 1.1rem 2rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

/* ---- Logo ---- */
.nav__logo {
  font-family: var(--font-display);
  font-size: 1.3rem;
  letter-spacing: -0.5px;
  color: var(--color-white);
  line-height: 1;
  opacity: 1;
  transition: opacity 0.3s ease;
}

.nav__logo:hover {
  opacity: 0.7;
}

.nav__logo-first {
  font-weight: 500;
}

.nav__logo-last {
  font-weight: 300;
  margin-left: 0.25em;
}

/* ---- Desktop links ---- */
.nav__links {
  list-style: none;
  display: flex;
  gap: 2.4rem;
}

.nav__link {
  font-family: var(--font-body);
  font-size: 0.8rem;
  font-weight: 300;
  letter-spacing: 0.16em;
  text-transform: uppercase;
  color: rgba(255, 255, 255, 0.55);
  position: relative;
  padding-bottom: 2px;
  transition: color 0.3s ease;
}

.nav__link::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  width: 0;
  height: 1px;
  background: var(--color-white);
  transition: width 0.35s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.nav__link:hover {
  color: var(--color-white);
  opacity: 1;
}

.nav__link:hover::after {
  width: 100%;
}

.nav__link--active {
  color: var(--color-white);
}

.nav__link--active::after {
  width: 100%;
}

/* ---- Hamburger ---- */
.nav__burger {
  display: none;
  background: none;
  border: none;
  cursor: pointer;
  width: 28px;
  height: 20px;
  position: relative;
  z-index: 110;
}

.nav__burger span {
  display: block;
  width: 100%;
  height: 1px;
  background: var(--color-white);
  position: absolute;
  left: 0;
  transition: transform 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94),
              opacity 0.3s ease;
}

.nav__burger span:first-child {
  top: 4px;
}

.nav__burger span:last-child {
  bottom: 4px;
}

.nav__burger--open span:first-child {
  top: 50%;
  transform: translateY(-50%) rotate(45deg);
}

.nav__burger--open span:last-child {
  bottom: auto;
  top: 50%;
  transform: translateY(-50%) rotate(-45deg);
}

/* ---- Mobile overlay ---- */
.nav__overlay {
  position: fixed;
  inset: 0;
  z-index: 105;
  background: rgba(10, 10, 10, 0.97);
  display: flex;
  align-items: center;
  justify-content: center;
}

.nav__mobile-links {
  list-style: none;
  text-align: center;
  display: flex;
  flex-direction: column;
  gap: 2.5rem;
}

.nav__mobile-links li {
  opacity: 1;
  transform: translateY(0);
  transition: opacity 0.4s ease, transform 0.4s ease;
}

.nav__mobile-link {
  font-family: var(--font-display);
  font-size: 2.2rem;
  font-weight: 400;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: rgba(255, 255, 255, 0.5);
  transition: color 0.3s ease;
}

.nav__mobile-link:hover,
.nav__mobile-link--active {
  color: var(--color-white);
  opacity: 1;
}

/* Overlay transitions */
.overlay-enter-active {
  transition: opacity 0.35s ease;
}

.overlay-leave-active {
  transition: opacity 0.25s ease;
}

.overlay-enter-from,
.overlay-leave-to {
  opacity: 0;
}

/* ---- Responsive ---- */
@media (max-width: 768px) {
  .nav__inner {
    padding: 1rem 1.5rem;
  }

  .nav__links {
    display: none;
  }

  .nav__burger {
    display: block;
  }
}
</style>
