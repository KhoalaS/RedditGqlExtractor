<script setup lang="ts">
import { useTemplateRef } from 'vue';
import { ControlButton, TitleBarButton } from '../utils/Types';
import { useDraggable } from '@vueuse/core';

const el = useTemplateRef('el');
// `style` will be a helper computed for `left: ?px; top: ?px;`
const { x, y, style } = useDraggable(el, {
  initialValue: { x: 400, y: 40 },
});

defineProps<{
  title: string;
  titleBarButtons?: TitleBarButton[];
  windowOpts?: {
    hasSpace?: boolean;
  };
  controlButtons?: ControlButton[];
}>();
</script>
<template>
  <div ref="el" :style="style" class="window active" style="position: fixed">
    <div class="title-bar">
      <div class="title-bar-text">{{ title }}</div>
      <div class="title-bar-controls">
        <button
          @click="btn.onClick"
          v-for="btn in titleBarButtons"
          :aria-label="btn.label"
        ></button>
      </div>
    </div>
    <div class="window-body" :class="{ 'has-space': windowOpts?.hasSpace }">
      <slot name="content"> </slot>
      <section
        class="field-row"
        style="justify-content: flex-end; margin-top: 8px"
      >
        <button
          @click="btn.onClick"
          v-for="btn in controlButtons"
          :class="{ default: btn.class }"
        >
          {{ btn.label }}
        </button>
      </section>
    </div>
  </div>
</template>

