'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "07ebba9f4afda9dfd6a207fcd5a5fecf",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/images/banner.jpg": "66096977638627a67bef6f84400bcaa6",
"assets/images/nsrmt.png": "d13aba85f6f907313355be7b8eab2b06",
"assets/LICENSE": "e6145f60d8cb28e5c6a85a24fa87247a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "d13aba85f6f907313355be7b8eab2b06",
"icons/Icon-192.png": "2995f3560b661d3fe633a6b146a7b730",
"icons/Icon-512.png": "0ae93d89b1bd02f4ea30ab39ac0dfb8e",
"index.html": "0eb05191a84530ab691b87e7a0ffce77",
"/": "0eb05191a84530ab691b87e7a0ffce77",
"main.dart.js": "a7685a37baf04a7cc1771d6e2274d531",
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
