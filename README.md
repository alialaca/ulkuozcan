# Ülkü Özcan — Kişisel Web Sitesi

Ülkü Özcan (Danışman Ortak) için tek sayfalık, kartvizit tarzında kişisel portfolio sitesi.

## Teknoloji

- **Vue 3** — Composition API, `<script setup>`
- **Vite** — Build & dev server
- **Pure CSS** — Scoped styles, CSS custom properties
- **Google Fonts** — Barlow Condensed + Poppins

## Kurulum

```bash
npm install
npm run dev       # http://localhost:5173
npm run build     # Production build → dist/
npm run preview   # Build önizleme
```

## Proje Yapısı

```
src/
├── App.vue                  # Ana uygulama, global stiller
├── main.js                  # Entry point
└── components/
    ├── NavBar.vue           # Navigasyon
    ├── HeroSection.vue      # Banner video + isim overlay
    ├── AboutSection.vue     # Biyografi
    ├── MediaSection.vue     # YouTube/Instagram linkleri
    └── ContactSection.vue   # İletişim bilgileri
public/
└── banner.mp4               # Hero banner videosu
```

## Tasarım

- Monochrome tema (siyah, beyaz, gri tonları)
- Scroll-reveal animasyonları (Intersection Observer)
- Mobil responsive (768px breakpoint)

## Deploy

```bash
npm run deploy    # CapRover CLI ile deploy
```
