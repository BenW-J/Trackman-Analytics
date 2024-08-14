import streamlit as st
import requests
import pandas as pd

if "symbols_list" not in st.session_state:
    st.session_state.symbols_list = None
    
st.set_page_config(
    layout = 'wide',
    page_title = 'Combine Analyser'
)

st.markdown(
    """
    <style>
        footer {display: none}
        [data-testid="stHeader"] {display: none}
    </style>
    """, unsafe_allow_html = True
)

with open('style.css') as f:
    st.markdown(f'<style>{f.read()}</style>', unsafe_allow_html = True)
        
title_col, t55_col, t65_col, t75_col, t85_col, t95_col, t105_col, t125_col,t145_col,t165_col,driver_col = st.columns([3.5,1,1,1,1,1,1,1,1,1,1])


with title_col:
    st.markdown('<p class="dashboard_title">Combine<br>Analyser</p>', unsafe_allow_html = True)

with t55_col:
    with st.container():
        btc_price = '82'
        st.markdown(f'<p class="btc_text">55m<br></p><p class="price_details">{btc_price}</p>', unsafe_allow_html = True)

with t65_col:
    with st.container():
        eth_price = '79'
        st.markdown(f'<p class="eth_text">65m<br></p><p class="price_details">{eth_price}</p>', unsafe_allow_html = True)

with t75_col:
    with st.container():
        xmr_price = '75'
        st.markdown(f'<p class="xmr_text">75m<br></p><p class="price_details">{xmr_price}</p>', unsafe_allow_html = True)

with t85_col:
    with st.container():
        sol_price = '68.2'
        st.markdown(f'<p class="sol_text">85m<br></p><p class="price_details">{sol_price}</p>', unsafe_allow_html = True)

with t95_col:
    with st.container():
        xrp_price = '69.0'
        st.markdown(f'<p class="xrp_text">95m<br></p><p class="price_details">{xrp_price}</p>', unsafe_allow_html = True)

with t105_col:
    with st.container():
        btc_price = '82'
        st.markdown(f'<p class="btc_text">105m<br></p><p class="price_details">{btc_price}</p>', unsafe_allow_html = True)
        
with t125_col:
    with st.container():
        btc_price = '88'
        st.markdown(f'<p class="btc_text">125m<br></p><p class="price_details">{btc_price}</p>', unsafe_allow_html = True)
        
with t145_col:
    with st.container():
        btc_price = '92'
        st.markdown(f'<p class="btc_text">55m<br></p><p class="price_details">{btc_price}</p>', unsafe_allow_html = True)

with t165_col:
    with st.container():
        btc_price = '52'
        st.markdown(f'<p class="btc_text">55m<br></p><p class="price_details">{btc_price}</p>', unsafe_allow_html = True)
        
with driver_col:
    with st.container():
        btc_price = '88'
        st.markdown(f'<p class="btc_text">Driver<br></p><p class="price_details">{btc_price}</p>', unsafe_allow_html = True)
        

params_col, chart_col, data_col = st.columns([0.5,1.2,0.6])

with params_col:
    
    with st.form(key = 'params_form'):
        
        st.markdown(f'<p class="params_text">CHART DATA PARAMETERS', unsafe_allow_html = True)
        
        st.divider()
        
        exchanges = ['binance', 'bitstamp', 'binancefutures', 'whitebit', 'bybit', 'gatetio', 'coinbase', 'binanceus', 'kraken']
        exchange = st.selectbox('Exchange', exchanges, key = 'exchange_selectbox')
        
        if st.session_state.symbols_list == None:
            symbols = []
            
        else:
            symbol = st.selectbox('Symbol', st.session_state.symbols_list, key = 'symbol_selectbox')
        
        interval_col, period_col = st.columns(2)
        with interval_col:
            interval = st.selectbox('Interval', ['1m', '5m', '15m', '30m', '1h', '2h', '4h', '12h', '1d'], key = 'interval_selectbox')
        with period_col:
            period = st.number_input('Period', min_value = 10, max_value = 500, value = 365, step = 1, key = 'period_no_input')
        
        st.markdown('')
        update_chart = st.form_submit_button('Update chart')
        st.markdown('')
        