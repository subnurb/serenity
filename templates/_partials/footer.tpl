{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<div class="sr-footer-before footer__before">
  {block name='hook_footer_before'}
    {hook h='displayFooterBefore'}
  {/block}
</div>

<div class="sr-footer-main footer__main">
  <div class="sr-footer-container container">
    <div class="sr-footer-top footer__main__top row">
      {block name='hook_footer'}
        {hook h='displayFooter'}
      {/block}
    </div>

    <div class="sr-footer-bottom footer__main__bottom row">
      {block name='hook_footer_after'}
        {hook h='displayFooterAfter'}
      {/block}
    </div>

    <p class="sr-copyright copyright">
      {block name='copyright_link'}
        <a class="sr-copyright-link" href="https://www.prestashop-project.org/" target="_blank" rel="noopener noreferrer nofollow">
          {l s='%copyright% %year% - Ecommerce software by %prestashop%' sprintf=['%prestashop%' => 'PrestaShop™', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
        </a>
      {/block}
    </p>
  </div>
</div>
