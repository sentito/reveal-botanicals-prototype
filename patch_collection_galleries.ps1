$indexPath = Join-Path $PSScriptRoot 'v12\index.html'
$dataPath = Join-Path $PSScriptRoot 'collection_gallery_data.js'
$html = Get-Content $indexPath -Raw -Encoding UTF8
$galleryData = Get-Content $dataPath -Raw -Encoding UTF8
$galleryData = $galleryData -replace '^\xEF\xBB\xBF', ''
$galleryData = $galleryData -replace '^// Auto-generated collection gallery data\r?\n', ''

$oldCss = @'
.collection-detail h2 {
  font-family: 'Sorts Mill Goudy', serif;
  font-size: 40px;
  color: #f5f0fa;
  margin-bottom: 24px;
}
.collection-detail-hero {
  width: 100%;
  border-radius: 4px;
  margin-bottom: 24px;
  box-shadow: 0 12px 40px rgba(0,0,0,0.35);
}
.collection-detail-note {
  font-size: 15px;
  color: #d5d2ff;
  line-height: 1.7;
  margin-bottom: 20px;
}
.collection-detail-note a { color: #c4a8e8; }
.collection-index-view.hidden { display: none; }
'@

$newCss = @'
.collection-detail-header { margin-bottom: 48px; text-align: center; }
.collection-detail h2 {
  font-family: 'Sorts Mill Goudy', serif;
  font-size: clamp(32px, 4vw, 42px);
  color: #f5f0fa;
  margin-bottom: 20px;
}
.collection-detail-quote {
  font-size: clamp(17px, 2.2vw, 21px);
  font-style: italic;
  color: #d5d2ff;
  line-height: 1.65;
  margin-bottom: 10px;
  max-width: 780px;
  margin-left: auto;
  margin-right: auto;
}
.collection-detail-attrib { font-size: 18px; color: #c4a8e8; margin: 0; }
.collection-gallery { display: flex; flex-direction: column; gap: 52px; }
.collection-gallery-image-wrap {
  cursor: zoom-in;
  border: none;
  padding: 0;
  background: none;
  width: 100%;
  display: block;
  text-align: left;
}
.collection-gallery-image-wrap img {
  width: 100%;
  display: block;
  border-radius: 2px;
  box-shadow: 0 8px 30px rgba(0,0,0,0.3);
}
.collection-gallery-credits {
  font-size: 14px;
  color: rgba(232,206,245,0.7);
  margin-top: 12px;
  font-style: italic;
}
.collection-gallery-text {
  font-size: clamp(17px, 2.2vw, 21px);
  line-height: 1.65;
  color: #edcdfa;
}
.collection-detail-actions {
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
  justify-content: center;
  margin: 52px 0 20px;
}
.collection-detail-actions a,
.collection-detail-actions button.collection-action-btn {
  display: inline-block;
  padding: 12px 28px;
  border: 1px solid rgba(232,206,245,0.45);
  background: none;
  color: #e8cef5;
  text-decoration: none;
  font-size: 13px;
  letter-spacing: 2px;
  text-transform: uppercase;
  border-radius: 2px;
  cursor: pointer;
  font-family: 'Raleway', sans-serif;
}
.collection-detail-actions a:hover,
.collection-detail-actions button.collection-action-btn:hover {
  background: rgba(232,206,245,0.12);
  color: #fff;
}
.collection-related {
  margin-top: 48px;
  padding-top: 40px;
  border-top: 1px solid rgba(232,206,245,0.15);
}
.collection-related h3 {
  font-family: 'Sorts Mill Goudy', serif;
  text-align: center;
  font-size: 18px;
  color: #d5d2ff;
  margin-bottom: 24px;
  font-weight: 400;
  line-height: 1.5;
}
.collection-related-grid {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  gap: 8px;
}
.collection-related-card {
  border: none;
  padding: 0;
  cursor: pointer;
  background: #2a2235;
  aspect-ratio: 4 / 3;
  overflow: hidden;
}
.collection-related-card img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  opacity: 0.88;
  transition: opacity 0.25s, transform 0.25s;
}
.collection-related-card:hover img { opacity: 1; transform: scale(1.03); }
.collection-lightbox {
  position: fixed;
  inset: 0;
  z-index: 200;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 40px 60px;
}
.collection-lightbox[hidden] { display: none !important; }
.collection-lightbox-backdrop {
  position: absolute;
  inset: 0;
  background: rgba(10,8,14,0.94);
}
.collection-lightbox-inner { position: relative; z-index: 1; max-width: 100%; text-align: center; }
.collection-lightbox-inner img {
  max-width: min(92vw, 1200px);
  max-height: 78vh;
  object-fit: contain;
  border-radius: 2px;
}
.collection-lightbox-caption {
  color: #d5d2ff;
  font-size: 13px;
  margin-top: 14px;
  font-style: italic;
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}
.collection-lightbox-close {
  position: fixed;
  top: 24px;
  right: 28px;
  z-index: 202;
  border: none;
  background: none;
  color: #fff;
  font-size: 36px;
  line-height: 1;
  cursor: pointer;
  opacity: 0.8;
}
.collection-lightbox-close:hover { opacity: 1; }
.collection-lightbox-nav {
  position: fixed;
  top: 50%;
  transform: translateY(-50%);
  z-index: 202;
  border: none;
  background: rgba(255,255,255,0.08);
  color: #fff;
  font-size: 28px;
  width: 48px;
  height: 48px;
  border-radius: 50%;
  cursor: pointer;
}
.collection-lightbox-nav:hover { background: rgba(255,255,255,0.16); }
.collection-lightbox-prev { left: 20px; }
.collection-lightbox-next { right: 20px; }
.collection-index-view.hidden { display: none; }
@media (max-width: 900px) {
  .collection-related-grid { grid-template-columns: repeat(3, 1fr); }
}
@media (max-width: 640px) {
  .collection-related-grid { grid-template-columns: repeat(2, 1fr); }
  .collection-lightbox { padding: 50px 16px; }
  .collection-lightbox-prev { left: 8px; }
  .collection-lightbox-next { right: 8px; }
}
'@

$html = $html.Replace($oldCss, $newCss)

$oldDetailHtml = @'
<div id="collection-detail-view" class="collection-detail">
  <button type="button" class="collection-detail-back" onclick="closeCollectionDetail()">&#8592; Back to Collection</button>
  <h2 id="collection-detail-title"></h2>
  <img id="collection-detail-img" class="collection-detail-hero" src="" alt="">
  <p class="collection-detail-note">This is a preview of the collection index card. The full image galleries with botanical captions live on the current site &mdash; <a id="collection-detail-link" href="#" target="_blank" rel="noopener">view the complete gallery</a>.</p>
</div>

</div>
'@

$newDetailHtml = @'
<div id="collection-detail-view" class="collection-detail">
  <button type="button" class="collection-detail-back" onclick="closeCollectionDetail()">&#8592; Back to Collection</button>
  <div class="collection-detail-header">
    <h2 id="collection-detail-title"></h2>
    <p id="collection-detail-description" class="collection-detail-quote"></p>
    <p id="collection-detail-attribution" class="collection-detail-attrib"></p>
  </div>
  <div id="collection-detail-content" class="collection-gallery"></div>
  <div class="collection-detail-actions">
    <button type="button" class="collection-action-btn" onclick="closeCollectionDetail()">Collection</button>
    <a href="#" onclick="showPage('contact'); return false;">Contact</a>
  </div>
  <div class="collection-related">
    <h3>Explore the Collection With the Thumbnails</h3>
    <div class="collection-related-grid" id="collection-related-grid"></div>
  </div>
</div>

<div id="collection-lightbox" class="collection-lightbox" hidden>
  <div class="collection-lightbox-backdrop" onclick="closeCollectionLightbox()"></div>
  <button type="button" class="collection-lightbox-close" onclick="closeCollectionLightbox()" aria-label="Close">&times;</button>
  <button type="button" class="collection-lightbox-nav collection-lightbox-prev" onclick="navigateCollectionLightbox(-1)" aria-label="Previous image">&#8249;</button>
  <button type="button" class="collection-lightbox-nav collection-lightbox-next" onclick="navigateCollectionLightbox(1)" aria-label="Next image">&#8250;</button>
  <div class="collection-lightbox-inner">
    <img id="collection-lightbox-img" src="" alt="">
    <p id="collection-lightbox-caption" class="collection-lightbox-caption"></p>
  </div>
</div>

</div>
'@

$html = $html.Replace($oldDetailHtml, $newDetailHtml)

$html = $html.Replace(
  'Prototype gallery &mdash; photos from revealbotanicals.com. Click any image to preview.',
  'Full botanical galleries from revealbotanicals.com &mdash; click any collection to explore.'
)

$oldJsStart = 'const collectionItems = ['
$oldJsEnd = @'
function closeCollectionDetail() {
  document.getElementById('collection-index-view').classList.remove('hidden');
  document.getElementById('collection-detail-view').classList.remove('active');
  window.scrollTo(0, 0);
}

function showPage(pageId) {
'@

$newJs = @"
$galleryData

const collectionItems = [
  { slug: 'force-within', title: 'The Force Within', img: 'https://cdn.myportfolio.com/f078068d-6ea1-4a2a-aa31-e8830096eee1/35a0398b-577a-4817-92b1-b36e973bd69d_carw_4x3x1280.jpeg?h=f10660846facbc8f9b3ee90d05a27682' },
  { slug: 'the-space-between', title: 'The Space Between', img: 'https://cdn.myportfolio.com/f078068d-6ea1-4a2a-aa31-e8830096eee1/28bd2f4c-867c-4178-8d3b-90ca314d6185_carw_4x3x1280.jpeg?h=bed35f9dac9f5f44cac642814b9ca230' },
  { slug: 'the-prospect-of-a-new-day', title: 'The Prospect of a New Day', img: 'https://cdn.myportfolio.com/f078068d-6ea1-4a2a-aa31-e8830096eee1/3f138168-fed0-4aae-a2e6-33d85a7b3450_carw_4x3x1280.jpg?h=6eb15b552b999f46514cd52b8a1ae23d' },
  { slug: 'guard-your-thoughts', title: 'Guard Your Thoughts', img: 'https://cdn.myportfolio.com/f078068d-6ea1-4a2a-aa31-e8830096eee1/382f0fa5-1ee4-411c-8328-fcfdddb59390_rwc_217x0x3413x2560x1280.jpg?h=0bfbaa4154fc8a70975744edaa93e86f' },
  { slug: 'compassion', title: 'Compassion', img: 'https://cdn.myportfolio.com/f078068d-6ea1-4a2a-aa31-e8830096eee1/3aa666a7-c02a-4438-be9a-06a2b420c9d0_carw_4x3x1280.jpeg?h=770dae2c3f180512ea652e58afc9de69' },
  { slug: 'to-be-revealed', title: 'Gone to the Meadow', img: 'https://cdn.myportfolio.com/f078068d-6ea1-4a2a-aa31-e8830096eee1/81c1645d-53cc-42b5-8573-b30d07871541_rwc_484x0x2879x2160x1280.jpg?h=cede426e1e94d8bfb1b120777fac9d32' },
  { slug: 'connect', title: 'Connect', img: 'https://cdn.myportfolio.com/f078068d-6ea1-4a2a-aa31-e8830096eee1/643e5386-6523-486c-9cf7-6ee4565dcfe1_rwc_56x0x889x667x889.jpg?h=adb70edb89dbf86c549fbcb522677278' },
  { slug: 'let-the-orchestra-play', title: 'Let the Orchestra Play', img: 'https://cdn.myportfolio.com/f078068d-6ea1-4a2a-aa31-e8830096eee1/ac17d0d0-0d28-46ea-ae12-ce61d7f53895_rwc_217x0x3413x2560x1280.jpg?h=35c8ef3303680167b3152e1f835a8776' },
  { slug: 'be-yourself', title: 'Be What You Are', img: 'https://cdn.myportfolio.com/f078068d-6ea1-4a2a-aa31-e8830096eee1/c10ec274-9b7a-41d2-b1ee-57ad04c75253_carw_4x3x1280.jpeg?h=a76fb97b1f75d14c86a080711d46e5a5' },
  { slug: 'light-and-shade', title: 'Light and Shade', img: 'https://cdn.myportfolio.com/f078068d-6ea1-4a2a-aa31-e8830096eee1/73938e29-3c17-4dff-b088-f65bbd33d2a0_carw_4x3x1280.jpeg?h=22cfa172504ac456d91390e80ba5ab72' }
];

let currentCollectionIndex = -1;
let currentCollectionImages = [];
let currentLightboxIndex = -1;

(function initCollectionGrid() {
  const grid = document.getElementById('collection-grid');
  if (!grid) return;
  grid.innerHTML = collectionItems.map(function(item, i) {
    return '<button type="button" class="collection-card" onclick="openCollectionDetail(' + i + ')" aria-label="' + item.title + '">' +
      '<img src="' + item.img + '" alt="' + item.title + '" loading="lazy">' +
      '<span class="collection-card-overlay"><span class="collection-card-title">' + item.title + '</span></span>' +
      '</button>';
  }).join('');
})();

function renderCollectionRelated(currentIndex) {
  const related = document.getElementById('collection-related-grid');
  if (!related) return;
  related.innerHTML = collectionItems.map(function(item, i) {
    if (i === currentIndex) return '';
    return '<button type="button" class="collection-related-card" onclick="openCollectionDetail(' + i + ')" aria-label="' + item.title + '">' +
      '<img src="' + item.img + '" alt="' + item.title + '" loading="lazy">' +
      '</button>';
  }).join('');
}

function renderCollectionGallery(gallery) {
  const content = document.getElementById('collection-detail-content');
  if (!content || !gallery) return;
  currentCollectionImages = [];
  let imageIndex = 0;
  content.innerHTML = gallery.blocks.map(function(block) {
    if (block.type === 'image') {
      const idx = imageIndex++;
      currentCollectionImages.push({ src: block.src, caption: block.caption || block.alt || '' });
      const credits = block.caption ? '<p class="collection-gallery-credits">' + block.caption + '</p>' : '';
      return '<button type="button" class="collection-gallery-image-wrap" onclick="openCollectionLightbox(' + idx + ')">' +
        '<img src="' + block.src + '" alt="' + (block.alt || '') + '" loading="lazy">' + credits + '</button>';
    }
    return '<p class="collection-gallery-text">' + block.text + '</p>';
  }).join('');
}

function openCollectionDetail(index) {
  const item = collectionItems[index];
  const gallery = collectionGalleryData[item.slug];
  if (!item || !gallery) return;
  currentCollectionIndex = index;
  document.getElementById('collection-detail-title').textContent = gallery.title;
  document.getElementById('collection-detail-description').textContent = gallery.description || '';
  const attribEl = document.getElementById('collection-detail-attribution');
  attribEl.textContent = gallery.attribution || '';
  attribEl.style.display = gallery.attribution ? 'block' : 'none';
  renderCollectionGallery(gallery);
  renderCollectionRelated(index);
  document.getElementById('collection-index-view').classList.add('hidden');
  document.getElementById('collection-detail-view').classList.add('active');
  window.scrollTo(0, 0);
}

function closeCollectionDetail() {
  closeCollectionLightbox();
  document.getElementById('collection-index-view').classList.remove('hidden');
  document.getElementById('collection-detail-view').classList.remove('active');
  currentCollectionIndex = -1;
  window.scrollTo(0, 0);
}

function openCollectionLightbox(imageIndex) {
  if (!currentCollectionImages.length || imageIndex < 0 || imageIndex >= currentCollectionImages.length) return;
  currentLightboxIndex = imageIndex;
  const img = currentCollectionImages[imageIndex];
  document.getElementById('collection-lightbox-img').src = img.src;
  document.getElementById('collection-lightbox-img').alt = img.caption;
  document.getElementById('collection-lightbox-caption').textContent = img.caption;
  document.getElementById('collection-lightbox').hidden = false;
  document.body.style.overflow = 'hidden';
}

function closeCollectionLightbox() {
  document.getElementById('collection-lightbox').hidden = true;
  if (!document.getElementById('plant-modal').hidden) return;
  if (document.getElementById('collection-detail-view').classList.contains('active')) {
    document.body.style.overflow = 'hidden';
    return;
  }
  document.body.style.overflow = '';
}

function navigateCollectionLightbox(direction) {
  if (currentLightboxIndex < 0) return;
  const next = currentLightboxIndex + direction;
  if (next < 0 || next >= currentCollectionImages.length) return;
  openCollectionLightbox(next);
}

function showPage(pageId) {
"@

$startIdx = $html.IndexOf($oldJsStart)
$endIdx = $html.IndexOf($oldJsEnd)
if ($startIdx -lt 0 -or $endIdx -lt 0) { throw "Could not find JS block to replace" }
$html = $html.Substring(0, $startIdx) + $newJs + $html.Substring($endIdx)

$oldEscape = @'
document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') closePlantModal();
});
'@

$newEscape = @'
document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') {
    if (!document.getElementById('collection-lightbox').hidden) closeCollectionLightbox();
    else closePlantModal();
  }
  if (!document.getElementById('collection-lightbox').hidden) {
    if (e.key === 'ArrowLeft') navigateCollectionLightbox(-1);
    if (e.key === 'ArrowRight') navigateCollectionLightbox(1);
  }
});
'@

$html = $html.Replace($oldEscape, $newEscape)

$html = $html.Replace(
  "closePlantModal();`r`n  closeCollectionDetail();",
  "closePlantModal();`r`n  closeCollectionLightbox();`r`n  closeCollectionDetail();"
)

Set-Content -Path $indexPath -Value $html -Encoding UTF8 -NoNewline
Write-Host "Patched $indexPath ($((Get-Item $indexPath).Length) bytes)"