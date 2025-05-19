export interface TitleBarButton extends WindowButton {
  label: 'Minimize' | 'Maximize' | 'Close';
  onClick: () => void;
}

export interface ControlButton extends WindowButton {
  class?: 'default';
}

export interface WindowButton {
  label: string;
  onClick: () => void;
  class?: string;
}

