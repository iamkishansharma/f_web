'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "c0315c8ef574ac586a978aaeffed3da5",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/images/banner.jpg": "66096977638627a67bef6f84400bcaa6",
"assets/images/nsrmt.png": "d13aba85f6f907313355be7b8eab2b06",
"assets/images/slide1.png": "2bb47116dfbe4a747701199f361f4674",
"assets/images/slide2.png": "9922991af0389ff59da8892d528f8b4a",
"assets/images/slide3.png": "1d44f06e7b93d66cec6695cb9b098a35",
"assets/LICENSE": "f9f6a95033a217df9e7f922903cdf23a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "d13aba85f6f907313355be7b8eab2b06",
"icons/Icon-192.png": "2995f3560b661d3fe633a6b146a7b730",
"icons/Icon-512.png": "0ae93d89b1bd02f4ea30ab39ac0dfb8e",
"index.html": "0eb05191a84530ab691b87e7a0ffce77",
"/": "0eb05191a84530ab691b87e7a0ffce77",
"main.dart.js": "9dc27459a1aa704e9143263e3d38e8d9",
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
