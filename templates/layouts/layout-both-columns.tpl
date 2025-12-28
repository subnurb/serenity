{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{include file='_partials/helpers.tpl'}

<!doctype html>
<html lang="{$language.locale}">
  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="sr-body sr-page-{$page.page_name} {$page.body_classes|classnames}">
    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}

    {block name='product_activation'}
      {include file='catalog/_partials/product-activation.tpl'}
    {/block}

    <header id="header" class="sr-header header js-sticky-header">
      {block name='header'}
        {include file='_partials/header.tpl'}
      {/block}
    </header>

    <main id="wrapper" class="sr-main sr-wrapper wrapper">
      {hook h='displayWrapperTop'}

      <nav class="sr-breadcrumb-wrapper" aria-label="breadcrumb">
        {block name='breadcrumb'}
          {include file='_partials/breadcrumb.tpl'}
        {/block}
      </nav>

      <div class="sr-notifications">
        {block name='notifications'}
          {include file='_partials/notifications.tpl'}
        {/block}
      </div>

      {block name='content_columns'}
        <div class="sr-content-container {block name='container_class'}container{/block}">
          <div class="sr-content-row row">
            {block name='left_column'}
              <aside id="left-column" class="sr-sidebar sr-sidebar-left wrapper__left-column col-md-4 col-lg-3">
                {if $page.page_name === 'product'}
                  {hook h='displayLeftColumnProduct'}
                {else}
                  {hook h='displayLeftColumn'}
                {/if}
              </aside>
            {/block}

            {block name='content_wrapper'}
              <section id="content-wrapper" class="sr-content sr-content-main wrapper__content col-md-4 col-lg-6">
                {hook h='displayContentWrapperTop'}
                {block name='content'}
                  <p>Hello world! This is HTML5 Boilerplate.</p>
                {/block}
                {hook h='displayContentWrapperBottom'}
              </section>
            {/block}

            {block name='right_column'}
              <aside id="right-column" class="sr-sidebar sr-sidebar-right wrapper__right-column col-md-4 col-lg-3">
                {if $page.page_name === 'product'}
                  {hook h='displayRightColumnProduct'}
                {else}
                  {hook h='displayRightColumn'}
                {/if}
              </aside>
            {/block}
          </div>
        </div>
      {/block}

      {hook h='displayWrapperBottom'}
    </main>

    <footer id="footer" class="sr-footer footer">
      {block name='footer'}
        {include file='_partials/footer.tpl'}
      {/block}
    </footer>

    {block name='javascript_bottom'}
      {include file='_partials/javascript.tpl' javascript=$javascript.bottom}
    {/block}

    {block name='bottom_elements'}
      {include file='components/page-loader.tpl'}
      {include file='components/toast-container.tpl'}
      {include file='components/password-policy-template.tpl'}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}
  </body>
</html>
