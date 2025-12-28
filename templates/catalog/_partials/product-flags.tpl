{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{block name='product_flags'}
  <ul class="sr-product-flags product-flags js-product-flags">
    {foreach from=$product.flags item=flag}
      <li class="sr-product-flag sr-product-flag-{$flag.type} badge {$flag.type}">{$flag.label}</li>
    {/foreach}
  </ul>
{/block}
