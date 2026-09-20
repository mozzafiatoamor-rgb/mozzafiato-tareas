/* Service Worker · Mozzafiato Tareas
   Cachea el shell para que la app funcione sin conexión / con conexión lenta. */
const CACHE = 'mozza-v1';
const SHELL = [
  './',
  './index.html',
  './app.data.js',
  './manifest.webmanifest',
  './icons/icon-192.png',
  './icons/icon-512.png'
];

self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(SHELL)).then(() => self.skipWaiting()));
});

self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys().then(keys => Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', e => {
  const req = e.request;
  if (req.method !== 'GET') return;
  const url = new URL(req.url);
  // No cachear llamadas a Supabase ni a CDNs de datos: siempre a la red.
  if (url.hostname.includes('supabase') || url.hostname.includes('jsdelivr') || url.hostname.includes('cloudflare')) return;
  // App shell: cache-first con actualización en segundo plano.
  e.respondWith(
    caches.match(req).then(cached => {
      const net = fetch(req).then(res => {
        if (res && res.status === 200 && url.origin === location.origin) {
          const copy = res.clone();
          caches.open(CACHE).then(c => c.put(req, copy));
        }
        return res;
      }).catch(() => cached);
      return cached || net;
    })
  );
});
