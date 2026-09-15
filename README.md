# 🐾 AmigoPet

<p align="center">
  <strong>Conectando tutores a cuidadores de pets de confiança.</strong>
</p>

<p align="center">
  Aplicativo mobile desenvolvido em Flutter para facilitar a conexão entre tutores de animais e cuidadores da própria vizinhança.
</p>

---

## 📱 Sobre o projeto

O **AmigoPet** é um aplicativo brasileiro criado para conectar tutores de animais de estimação a **passeadores e cuidadores de confiança** próximos à sua localização.

A proposta é ajudar pessoas que não possuem tempo para passear com seus cães ou que precisam encontrar alguém para cuidar de seus pets durante viagens, compromissos ou períodos de ausência.

O projeto apresenta um fluxo de navegação entre uma **lista de cuidadores disponíveis** e uma **tela de detalhes do cuidador**, permitindo ao usuário visualizar informações e interagir com diferentes opções do aplicativo.

---

## 🎯 Objetivo

O objetivo do projeto é desenvolver uma interface mobile simples, moderna e intuitiva para facilitar a busca por serviços de cuidados para animais.

O aplicativo foi desenvolvido utilizando componentes do **Material Design**, explorando recursos de navegação, menus, diálogos e listas do Flutter.

---

## ✨ Funcionalidades

### 👥 Lista de cuidadores

A tela principal apresenta:

- Lista de cuidadores disponíveis
- Foto do cuidador
- Nome
- Avaliação
- Quantidade de avaliações
- Distância
- Navegação para o perfil do cuidador
- Lista dinâmica utilizando `ListView.builder`

### 🔎 Ordenação e filtros

O aplicativo possui um `PopupMenuButton` com opções como:

- 📍 Mais próximos
- ⭐ Melhor avaliados
- 💰 Menor preço

### ☰ Menu de navegação

O `Drawer` disponibiliza opções de navegação:

- 👥 Cuidadores
- 📅 Meus agendamentos
- ⚙️ Configurações

### 👤 Detalhes do cuidador

Ao selecionar um cuidador, o usuário é direcionado para sua tela de detalhes, onde pode visualizar:

- Foto
- Nome
- Avaliação
- Número de avaliações
- Distância
- Experiência
- Especialidade
- Descrição do cuidador

### 🐶 Tipo de serviço

O botão **"Tipo de serviço"** abre um `SimpleDialog` com as opções:

- 🚶 Passeio
- 🏠 Hospedagem
- ✂️ Banho e tosa

### ❌ Cancelamento

O botão **"Cancelar agendamento"** abre um `AlertDialog` solicitando confirmação antes do cancelamento.

### ⋮ Mais opções

O botão de opções abre um `BottomSheet` contendo:

- 📤 Compartilhar perfil
- 🚩 Denunciar

---

## 🧭 Fluxo de navegação

O fluxo principal do aplicativo funciona da seguinte forma:

```text
                    ┌─────────────────────┐
                    │     AmigoPet        │
                    │ Lista de cuidadores │
                    └──────────┬──────────┘
                               │
                               │ Toque no cuidador
                               ▼
                    ┌─────────────────────┐
                    │  Detalhes do        │
                    │     cuidador        │
                    └──────────┬──────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
              ▼                ▼                ▼
       Tipo de serviço    Cancelar         Mais opções
              │          agendamento            │
              ▼                ▼                ▼
        SimpleDialog     AlertDialog       BottomSheet
