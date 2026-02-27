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

const bioIntro = '24 Ekim 1985 Samsun doğumludur. Ankara Üniversitesi Siyasal Bilgiler Fakültesi 2008 mezunudur. Yüksek Lisansını İstanbul Bilgi Üniversitesi\'nde MBA alanında 2013 yılında tamamlamıştır.'

const bioParagraphs = [
  'Profesyonel kariyerinin ilk yıllarını Ziraat Bankası\'nda bireysel krediler departmanında çalışarak geçirmiştir.',
  '2018 yılında eğitim geçmişini ve profesyonel kariyerini birleştirerek gayrimenkul sektöründe geçiş yapmıştır.',
  '2018 Mayıs\u20132023 Ağustos ayları arasında Remax LOT bünyesinde; 2023 Ağustostan bugüne KW BORSA bünyesinde çalışmalarını sürdürmektedir.',
  '2020 Aralık itibariyle Remax Collection Uluslararası Lüks Konut Uzmanı ünvanı almaya hak kazanmıştır. 2020 yılından itibaren, sosyal medyayı gayrimenkul pazarlamasına entegre eden Türkiye\'deki ilk gayrimenkul danışmanlarından biridir.',
  'Özellikle; Ankara Çankaya ve Gölbaşı ilçelerinde Çayyolu, Alacaatlı, İncek, Beytepe bölgesindeki Lüks Konutların değerleme, satış, kiralama ve pazarlama stratejilerini yürütmektedir.',
  'Ankara bölgesi haricinde Bodrum ve Kıbrıs\'ta da proje ve portföy çalışmalarına devam etmektedir.',
  'Sektöre yeni başlayan ve sektördeki gayrimenkul danışmanları için sosyal medya eğitimleri vermektedir.',
]

const bioQuote = '\'Herkesin bir gayrimenkul danışmanı olmalı\' fikrinden hareketle; yüksek hizmet ve değer anlayışını, yalnızca doğru fiyatlanmış gayrimenkullerle çalışma prensibiyle harmanlayarak sektörün değişimine ve gelişimine odaklı çalışmalarını sürdürmektedir.'
</script>

<template>
  <section id="hakkinda" class="about" ref="sectionRef">
    <div class="about__container" :class="{ 'about__container--visible': visible }">
      <div class="about__header">
        <span class="about__label">Hakkında</span>
        <h2 class="about__heading">ÜLKÜ ÖZCAN KİMDİR?</h2>
        <div class="about__heading-rule"></div>
      </div>

      <div class="about__body">
        <div class="about__photo-col">
          <div class="about__photo-frame">
            <img
              src="/ulkuozcan.jpg"
              alt="Ülkü Özcan"
              class="about__photo-img"
            />
            <div class="about__photo-border"></div>
          </div>
        </div>

        <div class="about__text-col">
          <p class="about__intro">{{ bioIntro }}</p>

          <p v-for="(para, i) in bioParagraphs" :key="i" class="about__paragraph">
            {{ para }}
          </p>

          <blockquote class="about__quote">
            <div class="about__quote-mark">&ldquo;</div>
            <p>{{ bioQuote }}</p>
          </blockquote>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.about {
  padding: var(--section-padding) 1.5rem;
  background: var(--color-bg-alt);
  position: relative;
}

.about::before {
  content: '';
  position: absolute;
  top: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 1px;
  height: 60px;
  background: linear-gradient(to bottom, var(--color-divider-strong), transparent);
}

.about__container {
  max-width: var(--content-width);
  margin: 0 auto;
  opacity: 0;
  transform: translateY(40px);
  transition: opacity 1s cubic-bezier(0.25, 0.46, 0.45, 0.94),
              transform 1s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.about__container--visible {
  opacity: 1;
  transform: translateY(0);
}

.about__header {
  text-align: center;
  margin-bottom: 4rem;
}

.about__label {
  font-family: var(--font-body);
  font-size: 0.7rem;
  font-weight: 400;
  letter-spacing: 0.3em;
  text-transform: uppercase;
  color: var(--color-text-muted);
  display: block;
  margin-bottom: 1rem;
}

.about__heading {
  font-family: var(--font-display);
  font-size: clamp(2rem, 4.5vw, 3.2rem);
  font-weight: 600;
  color: var(--color-white);
  letter-spacing: 0.08em;
  text-transform: uppercase;
}

.about__heading-rule {
  width: 60px;
  height: 1px;
  background: var(--color-divider-strong);
  margin: 1.5rem auto 0;
}

.about__body {
  display: grid;
  grid-template-columns: 280px 1fr;
  gap: 4rem;
  align-items: start;
}

.about__photo-col {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: sticky;
  top: 5rem;
}

.about__photo-frame {
  position: relative;
  width: 200px;
  height: 200px;
  border-radius: 50%;
  margin-bottom: 0;
}

.about__photo-img {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  object-fit: cover;
  filter: grayscale(100%);
}

.about__photo-border {
  position: absolute;
  inset: -6px;
  border-radius: 50%;
  border: 1px solid var(--color-divider);
}

.about__text-col {
  padding-top: 0.5rem;
}

.about__intro {
  font-family: var(--font-display);
  font-size: 1.4rem;
  font-weight: 400;
  line-height: 1.7;
  color: var(--color-text);
  margin-bottom: 2rem;
  font-style: italic;
}

.about__paragraph {
  font-size: 0.95rem;
  color: var(--color-text-muted);
  margin-bottom: 1.2rem;
  line-height: 1.8;
  font-weight: 300;
}

.about__quote {
  margin-top: 2.5rem;
  padding: 2rem 2rem 2rem 2.5rem;
  border-left: 2px solid var(--color-white);
  background: var(--color-accent-dim);
  border-radius: 0 2px 2px 0;
  position: relative;
}

.about__quote-mark {
  font-family: var(--font-display);
  font-size: 4rem;
  color: var(--color-white);
  opacity: 0.2;
  line-height: 1;
  position: absolute;
  top: 0.5rem;
  left: 1rem;
}

.about__quote p {
  font-family: var(--font-body);
  font-size: 0.95rem;
  font-style: italic;
  line-height: 1.8;
  color: var(--color-text);
  position: relative;
  z-index: 1;
  font-weight: 300;
}

@media (max-width: 768px) {
  .about__body {
    grid-template-columns: 1fr;
    gap: 2.5rem;
  }

  .about__photo-col {
    position: static;
  }

  .about__photo-frame {
    width: 160px;
    height: 160px;
  }

  .about__quote {
    padding: 1.5rem 1.5rem 1.5rem 2rem;
  }
}
</style>
