<?php
// Google on the left, ours on the right

use Winter\Location\Models\Setting;
use Acorn\Location\Models\Location;
use Acorn\Location\Models\Lookup;
use Acorn\Location\Models\Settings;
use Acorn\Location\Controllers\Lookups;
use \Backend\Widgets\Form as WidgetForm;

$google_address_lookup       = (Settings::get('google-address-lookup') == '1');
$google_address_lookup_class = ($google_address_lookup ? 'google-address-lookup' : '');
$google_maps_key             = Setting::get('google_maps_key');
?>

<?php Block::put('breadcrumb') ?>
    <ul>
        <li><a href="<?= Backend::url('acorn/location/locations') ?>">Location</a></li>
        <li><?= e($this->pageTitle) ?></li>
    </ul>
<?php Block::endPut() ?>

<?php if (!$this->fatalError): ?>
    <?= Form::open(['class' => 'layout']) ?>
        <?php if ($google_address_lookup): ?>    
            <div id="location-lookup" class="<?= $google_address_lookup_class ?>">
                <div class="layout-row">
                    <?php if (!$google_maps_key) print($this->makeHintPartial('no_api_key', array(
                        'type'  => 'warning',
                        'title' => trans('acorn.location::lang.plugin.api_key_required'),
                        'icon'  => 'icon-warning'
                    ))); ?>
                    <?php
                        $lookup  = new Lookup();
                        $lookups = new Lookups();
                        $lookups->initForm($lookup, 'create');
                        // This does:
                        //   $formWidget   = $this->makeFormWidget(WidgetForm::class, $fieldConfig, $widgetConfig);
                        //   $formWidget->render($options);
                        // TODO: if (!$google_maps_key) $this->form->fields->address->readOnly = TRUE;
                        print($lookups->formRender());
                    ?>
                </div>
            </div>
        <?php endif ?>

        <div id="location-create" class="<?= $google_address_lookup_class ?>">
            <div class="layout-row">
                <?php print($this->formRender()); ?>
            </div>

            <div class="form-buttons">
                <div class="loading-indicator-container">
                    <button
                        type="submit"
                        data-request="onSave"
                        data-hotkey="ctrl+s, cmd+s"
                        data-load-indicator="<?= e(trans('backend::lang.form.saving')) ?>"
                        class="btn btn-primary">
                        <?= e(trans('backend::lang.form.create')) ?>
                    </button>
                    <button
                        type="button"
                        data-request="onSave"
                        data-request-data="close:1"
                        data-hotkey="ctrl+enter, cmd+enter"
                        data-load-indicator="<?= e(trans('backend::lang.form.saving')) ?>"
                        class="btn btn-default">
                        <?= e(trans('backend::lang.form.create_and_close')) ?>
                    </button>
                    <span class="btn-text">
                        <?= e(trans('backend::lang.form.or')) ?> <a href="<?= Backend::url('acorn/location/locations') ?>"><?= e(trans('backend::lang.form.cancel')) ?></a>
                    </span>
                </div>
            </div>
        </div>
    <?= Form::close() ?>

<?php else: ?>
    <p class="flash-message static error"><?= e(trans($this->fatalError)) ?></p>
    <p><a href="<?= Backend::url('acorn/location/locations') ?>" class="btn btn-default"><?= e(trans('backend::lang.form.return_to_list')) ?></a></p>
<?php endif ?>
