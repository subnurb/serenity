{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{extends file=$layout}

{block name='content'}
  <div class="sr-cart-page sr-cart-grid cart-grid row">
    <!-- Left Block: cart product informations & shpping -->
    <div class="sr-cart-main sr-cart-body cart-grid__body col-lg-8">
      <h1 class="sr-page-title sr-cart-title h4">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>

      <!-- cart products detailed -->
      <div class="sr-cart-container cart-container mb-3">
        <div class="sr-cart-alert js-cart-update-alert" data-alert="{l s='has been removed from the cart.' d='Shop.Theme.Actions' js=1}"></div>

        {block name='cart_overview'}
          <div class="sr-cart-products">
            {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
          </div>
        {/block}

        {block name='continue_shopping'}
          <a class="sr-btn sr-btn-continue-shopping btn btn-outline-primary btn-with-icon" href="{$urls.pages.index}">
            <i class="sr-icon sr-icon-back material-icons rtl-flip" aria-hidden="true">chevron_left</i>
            {l s='Continue shopping' d='Shop.Theme.Actions'}
          </a>
        {/block}

        <!-- shipping informations -->
        {block name='hook_shopping_cart_footer'}
          <div class="sr-cart-footer-hook">
            {hook h='displayShoppingCartFooter'}
          </div>
        {/block}
      </div>
    </div>


    <!-- Right Block: cart subtotal & cart total -->
    <aside class="sr-cart-sidebar sr-cart-summary-wrapper cart-grid__right col-lg-4">
      <h2 class="sr-cart-summary-title h4">{l s='Order summary' d='Shop.Theme.Checkout'}</h2>
      {block name='cart_summary'}
        <div class="sr-cart-summary-card card cart-summary">
          {block name='hook_shopping_cart'}
            <div class="sr-cart-hook">
              {hook h='displayShoppingCart'}
            </div>
          {/block}

          {block name='cart_totals'}
            <div class="sr-cart-totals">
              {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
            </div>
          {/block}

          {block name='cart_actions'}
            <div class="sr-cart-actions">
              {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
            </div>
          {/block}
        </div>
      {/block}

      <hr class="sr-divider" />

      {block name='hook_reassurance'}
        <div class="sr-reassurance">
          {hook h='displayReassurance'}
        </div>
      {/block}
    </aside>
  </div>

  <div class="sr-cross-selling">
    {hook h='displayCrossSellingShoppingCart'}
  </div>
{/block}
