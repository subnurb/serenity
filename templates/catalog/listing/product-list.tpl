{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{extends file=$layout}

{block name='head_microdata_special'}
  {include file='_partials/microdata/product-list-jsonld.tpl' listing=$listing}
{/block}

{block name='content'}

    {block name='product_list_header'}
      <h1 id="js-product-list-header" class="sr-page-title sr-listing-title h2 mb-4">{$listing.label}</h1>
    {/block}

    <div class="sr-category-header">
      {hook h='displayHeaderCategory'}
    </div>

    <section id="products" class="sr-products-section sr-product-listing">
      {if $listing.products|count}

        {block name='product_list_top'}
          <div class="sr-products-toolbar sr-products-toolbar-top">
            {include file='catalog/_partials/products-top.tpl' listing=$listing}
          </div>
        {/block}

        {block name='product_list_active_filters'}
          <div class="sr-active-filters">
            {$listing.rendered_active_filters nofilter}
          </div>
        {/block}

        {block name='product_list'}
          {if isset($page.body_classes['layout-full-width'])}
            {assign var="classes" value="col-12 col-xs-6 col-lg-4 col-xl-3"}
          {elseif isset($page.body_classes['layout-left-column']) || isset($page.body_classes['layout-right-column'])}
            {assign var="classes" value="col-12 col-xs-6 col-xl-4"}
          {elseif isset($page.body_classes['layout-both-columns'])}
            {assign var="classes" value="col-12 col-xs-6 col-md-12 col-lg-6"}
          {else}
            {assign var="classes" value="col-12 col-xs-6 col-lg-4 col-xl-3"}
          {/if}
          <div class="sr-products-grid">
            {include file='catalog/_partials/products.tpl' listing=$listing productClass=$classes}
          </div>
        {/block}

        {block name='product_list_bottom'}
          <div class="sr-products-toolbar sr-products-toolbar-bottom">
            {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
          </div>
        {/block}

      {else}
        <div id="js-product-list-top"></div>

        <div id="js-product-list" class="sr-no-products">
          {capture assign="errorContent"}
            <p class="sr-no-products-title h4">{l s='No products available yet' d='Shop.Theme.Catalog'}</p>
            <p class="sr-no-products-text">{l s='Stay tuned! More products will be shown here as they are added.' d='Shop.Theme.Catalog'}</p>
          {/capture}

          {include file='errors/not-found.tpl' errorContent=$errorContent}
        <div>

        <div id="js-product-list-bottom"></div>
      {/if}
    </section>


    {block name='product_list_footer'}{/block}

    <div class="sr-category-footer">
      {hook h='displayFooterCategory'}
    </div>
{/block}
