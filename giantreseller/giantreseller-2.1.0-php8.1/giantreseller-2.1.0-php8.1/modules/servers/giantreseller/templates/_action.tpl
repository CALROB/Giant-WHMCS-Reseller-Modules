{* Opens a client-action form. Include with action=<key>; close with </form>. *}
<form method="post" action="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;modop=custom&amp;a=clientaction" style="display:inline">
    <input type="hidden" name="token" value="{$token}">
    <input type="hidden" name="giant_action" value="{$action|escape}">
