{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{extends file='layouts/layout-both-columns.tpl'}

{block name="content_columns"}
  <div class="sr-content-container sr-content-with-sidebar {block name="container_class"}container{/block}">
    <div class="sr-content-row row">
      {block name="left_column"}
        <aside id="left-column" class="sr-sidebar sr-sidebar-left wrapper__left-column col-md-4 col-lg-3">
          {if $page.page_name == 'product'}
            {hook h='displayLeftColumnProduct'}
          {else}
            {hook h='displayLeftColumn'}
          {/if}
        </aside>
      {/block}

      {block name="content_wrapper"}
        <section id="content-wrapper" class="sr-content sr-content-main wrapper__content col-md-8 col-lg-9">
          {hook h='displayContentWrapperTop'}
          {block name="content"}
            <p>Hello world! This is HTML5 Boilerplate.</p>
          {/block}
          {hook h='displayContentWrapperBottom'}
        </section>
      {/block}

      {block name='right_column'}{/block}
    </div>
  </div>
{/block}
