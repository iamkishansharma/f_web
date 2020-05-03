'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "3a5e461d8d37f2dc27a51ac3a1e2a334",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/images/banner.jpg": "66096977638627a67bef6f84400bcaa6",
"assets/images/nsrmt.png": "d13aba85f6f907313355be7b8eab2b06",
"assets/images/slide1.png": "2bb47116dfbe4a747701199f361f4674",
"assets/images/slide2.png": "9922991af0389ff59da8892d528f8b4a",
"assets/images/slide3.png": "1d44f06e7b93d66cec6695cb9b098a35",
"assets/images/vicon/calendar.png": "46a9340cc4b2ecca10bdee58512b769a",
"assets/images/vicon/festival.png": "71afc4bc7cf1109fae6dedc0767abe41",
"assets/images/vicon/food.png": "cad68c72a220ff1103c5650d3bb5c761",
"assets/images/vicon/map.png": "76a830c20d58524272aa3e2096124873",
"assets/images/vicon/notification.png": "012c87127d05bb9b7e53a7a387d89e03",
"assets/images/vicon/setting.png": "3a7dd09f5ed0e8e6648b814226c719be",
"assets/images/vicon/todo.png": "a5efa6f70a3e99e905c0327874e922b9",
"assets/LICENSE": "f719c97230bddba46ce9bfdc2fb1b46a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "d13aba85f6f907313355be7b8eab2b06",
"icons/Icon-192.png": "2995f3560b661d3fe633a6b146a7b730",
"icons/Icon-512.png": "0ae93d89b1bd02f4ea30ab39ac0dfb8e",
"index.html": "0eb05191a84530ab691b87e7a0ffce77",
"/": "0eb05191a84530ab691b87e7a0ffce77",
"main.dart.js": "380374887da404ad0112a4b9a670e4eb",
"manifest.json": "7c4950c8b30e875cbd5d7669172a8018"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
