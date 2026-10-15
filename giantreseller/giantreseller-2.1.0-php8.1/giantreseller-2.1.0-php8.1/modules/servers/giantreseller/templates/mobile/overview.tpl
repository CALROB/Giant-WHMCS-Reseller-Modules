{assign var=tpl value="`$smarty.current_dir`/../_action.tpl"}

<h3>{$lang.mobile_sims|escape}</h3>
{if $gr.sims}
<div class="table-responsive">
<table class="table table-striped">
    <thead><tr>
        <th>{$lang.mobile_number|escape}</th>
        <th>{$lang.mobile_iccid|escape}</th>
        <th>{$lang.mobile_tariff|escape}</th>
        <th>{$lang.mobile_state|escape}</th>
        <th>{$lang.mobile_usage|escape}</th>
        {if $gr.can_bar || $gr.can_unbar}<th></th>{/if}
    </tr></thead>
    <tbody>
    {foreach $gr.sims as $s}
        <tr>
            <td>{$s.number|escape}</td>
            <td>{$s.iccid|escape}</td>
            <td>{$s.tariff|escape}</td>
            <td>{$s.state|escape}{if $s.barred} <span class="label label-warning">{$lang.mobile_barred|escape}</span>{/if}</td>
            <td>
                {if $s.usage_mb !== null}{$s.usage_mb|escape} MB{if $s.allowance !== null} / {$s.allowance|escape} MB{/if}{/if}
            </td>
            {if $gr.can_bar || $gr.can_unbar}
            <td>
                {if $s.barred && $gr.can_unbar}
                    {include file=$tpl action='mobile_unbar'}
                        <input type="hidden" name="sim" value="{$s.ref|escape}">
                        <button type="submit" class="btn btn-xs btn-default">{$lang.mobile_unbar|escape}</button>
                    </form>
                {elseif !$s.barred && $gr.can_bar}
                    {include file=$tpl action='mobile_bar'}
                        <input type="hidden" name="sim" value="{$s.ref|escape}">
                        <button type="submit" class="btn btn-xs btn-warning">{$lang.mobile_bar|escape}</button>
                    </form>
                {/if}
            </td>
            {/if}
        </tr>
    {/foreach}
    </tbody>
</table>
</div>
{else}
<p class="text-muted">{$lang.mobile_no_sims|escape}</p>
{/if}

<p class="text-muted small">{$lang.refresh_note|escape}</p>
