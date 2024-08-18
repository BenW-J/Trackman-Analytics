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
        
title_col, player_col, t55_col, t65_col, t75_col, t85_col, t95_col, t105_col, t125_col,t145_col,t165_col,driver_col = st.columns([1.5,2,1,1,1,1,1,1,1,1,1,1])


with title_col:
    st.markdown('<p class="dashboard_title">Trackman<br>Analysis</p>', unsafe_allow_html = True)
    

with player_col:
    st.markdown('<p class="dashboard_title">Ben<br>Wagner-Jordan</p>', unsafe_allow_html = True)

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
        
