{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{$headerTopName = 'header-top'}
{$headerBottomName = 'header-bottom'}

{block name='header_banner'}
  <div class="sr-header-banner header__banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_nav'}
  <nav class="sr-header-nav sr-nav-top {$headerTopName}" aria-label="{l s='Top navigation' d='Shop.Theme.Global'}">
    <div class="sr-header-nav-container container-md">
      <div class="sr-header-nav-row {$headerTopName}-desktop d-none d-md-flex row">
        <div class="sr-header-nav-left {$headerTopName}__left col-md-5">
          {hook h='displayNav1'}
        </div>

        <div class="sr-header-nav-right {$headerTopName}__right col-md-7">
          {hook h='displayNav2'}
        </div>
      </div>
    </div>
  </nav>
{/block}

{block name='header_bottom'}
  <div class="sr-header-main {$headerBottomName}">
    <div class="sr-header-main-container container-md {$headerBottomName}__container">
      <div class="sr-header-main-row row gx-2 align-items-stretch {$headerBottomName}__row">
        <div class="sr-logo-wrapper d-flex align-items-center col-auto logo order-xl-1 ms-lg-0 ms-2 me-lg-0 me-auto">
          {if $shop.logo_details}
            {if $page.page_name == 'index'}<h1 class="sr-logo-title {$headerBottomName}__h1 mb-0">{/if}
              {renderLogo}
            {if $page.page_name == 'index'}</h1>{/if}
          {/if}
        </div>

        <div class="sr-search-mobile search__mobile d-md-none d-flex col-auto">

          <div class="sr-search-trigger header-block d-flex align-items-center">
            <a class="sr-search-btn header-block__action-btn" href="#" role="button" data-bs-toggle="offcanvas" data-bs-target="#searchCanvas" aria-controls="searchCanvas" aria-label="{l s='Show search bar' d='Shop.Theme.Global'}">
              <span class="sr-icon sr-icon-search material-icons header-block__icon">search</span>
            </a>
          </div>

          <div class="sr-search-offcanvas search__offcanvas js-search-offcanvas offcanvas offcanvas-top h-auto" data-bs-backdrop="false" data-bs-scroll="true" tabindex="-1" id="searchCanvas" aria-labelledby="offcanvasTopLabel">
            <div class="sr-search-offcanvas-header offcanvas-header">
              <div id="_mobile_search" class="sr-search-container search__container"></div>
              <button type="button" class="sr-btn-close btn-close text-reset ms-1" data-bs-dismiss="offcanvas" aria-label="Close">{l s='Cancel' d='Shop.Theme.Global'}</button>
            </div>
          </div>
        </div>

        {hook h='displayTop'}

        <div id="_mobile_user_info" class="sr-user-info-mobile d-md-none d-flex col-auto">
          {* JUST PLACEHOLDER FOR RESPONSIVE COMPONENT TO LOAD REAL ONE *}
          <div class="sr-user-block header-block">
            <span class="sr-user-btn header-block__action-btn">
              <i class="sr-icon sr-icon-user material-icons header-block__icon" aria-hidden="true">&#xE7FD;</i>
              <span class="sr-user-label d-none d-md-inline header-block__title">{l s='Sign in' d='Shop.Theme.Actions'}</span>
            </span>
          </div>
          {* JUST PLACEHOLDER FOR RESPONSIVE COMPONENT TO LOAD REAL ONE *}
        </div>

        <div id="_mobile_cart" class="sr-cart-mobile d-md-none col-auto d-flex">
          {* JUST PLACEHOLDER FOR RESPONSIVE COMPONENT TO LOAD REAL ONE *}
          <div class="sr-cart-block header-block d-flex align-items-center">
            <span class="sr-cart-btn header-block__action-btn">
              <i class="sr-icon sr-icon-cart material-icons header-block__icon" aria-hidden="true">shopping_cart</i>
              <span class="sr-cart-count header-block__badge">{$cart.products_count}</span>
            </span>
          </div>
          {* JUST PLACEHOLDER FOR RESPONSIVE COMPONENT TO LOAD REAL ONE *}
        </div>
      </div>
    </div>
  </div>

  {hook h='displayNavFullWidth'}
{/block}
