{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{extends file='layouts/layout-both-columns.tpl'}

{block name='content_columns'}
  <div class="sr-content-container sr-content-full-width {block name='container_class'}container{/block}">
  {block name='left_column'}{/block}
  {block name='content_wrapper'}
    <section id="content-wrapper" class="sr-content sr-content-main wrapper__content wrapper__content-full-width">
      {hook h='displayContentWrapperTop'}
      {block name='content'}
        <p>Hello world! This is HTML5 Boilerplate.</p>
      {/block}
      {hook h='displayContentWrapperBottom'}
    </section>
  {/block}
  {block name='right_column'}{/block}
  </div>
{/block}
